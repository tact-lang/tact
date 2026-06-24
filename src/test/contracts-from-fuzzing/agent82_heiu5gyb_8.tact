contract A {
    receive() {}
}

contract TestValidInitCodeA {
    receive() {
        // Valid usage: obtain the initial state of A and then compute its address
        let addr: Address = contractAddress(initOf A());
        // Valid usage: obtain the code cell of A
        let code: Cell = codeOf A;
        dump(addr);
        dump(code);
    }
}
