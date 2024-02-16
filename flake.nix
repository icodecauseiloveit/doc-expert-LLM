
{
  description = "PDF trained Chat-Bot with LLM";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
      pythonPackages = pkgs.python311Packages;
      pyPkgs = with pythonPackages; [
        huggingface-hub
        streamlit
        python-dotenv
        pypdf2
        faiss
        #langchain
      ];
    in
    {
      devShells.x86_64-linux = {
        default = pkgs.mkShell {
          buildInputs = [ 
            pyPkgs

          ];
        };
      };
    };
}