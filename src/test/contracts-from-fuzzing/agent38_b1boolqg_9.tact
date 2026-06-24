contract ParamContr(a: Int, b: Int) {}

contract UseParam {
    receive() {
        // Valid: using initOf and codeOf on a contract with contract parameters
        let pkg: StateInit = initOf ParamContr(100, 200);
        let code: Cell = codeOf ParamContr;
    }
}
