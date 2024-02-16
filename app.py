import streamlit as st

import langchain


def main():
    print ("hello world")

    st.set_page_config(
        page_title='Modelo RAG para responder preguntas de varios PDF', 
        page_icon=':books:'
    )

    st.header("Responder preguntas de varios PDF")
    st.text_input('Haz una preguna acerca de los documentos:')

    with st.sidebar:
        st.subheader("Leer documentos")
        st.file_uploader("Sube tus PDF's aqui y haz click en 'Procesar'")
        st.button('Procesar')



if __name__ == '__main__':
    main()