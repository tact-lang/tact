contract B(param: Int) {
    receive() {
         let init_state = initOf B(42);
         let code_state = codeOf B;
    }
}
