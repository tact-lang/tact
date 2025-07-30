contract WithInit {
    var: Int;
    init() {
        self.var = 123;
    }
    receive() {}
}

contract UseWithInit {
    receive() {
        // Valid: using initOf and codeOf on a contract with an explicit init() function
        let st: StateInit = initOf WithInit();
        let code: Cell = codeOf WithInit;
    }
}
