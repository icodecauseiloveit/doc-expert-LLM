
{
  description = "PDF trained Chat-Bot with LLM";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-langchain1-0.url = "github:nixos/nixpkgs/4d3d04cfd372a0511f12b885c9822e406b00fe8e";
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    pythonPackages = pkgs.python311Packages;
    pyPkgs = with pythonPackages; [
      huggingface-hub
      streamlit
      python-dotenv
      pypdf2
      faiss
      # langchain
    ] ++ [ inputs.nixpkgs-langchain1-0.legacyPackages.${system}.python311Packages.langchain ]; # Old langchain version
  in
  {
    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [ 
          pyPkgs
        ];
      };
    };
  };
}
