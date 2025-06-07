contract Empty {
    // Contract with no parameters and no init() provided explicitly
    // It will have an implicit empty init()
    receive() {}
}

contract Test6 {
    receive() {
         let init_empty = initOf Empty();
         let code_empty = codeOf Empty;
    }
}
