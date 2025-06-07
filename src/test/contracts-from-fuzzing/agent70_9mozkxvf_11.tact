contract Test {
    receive() {
        let code: Cell = codeOf Test;
        dump(code);
        let addr1: Address = myAddress();
        let addr2: Address = contractAddress(initOf Test());
        dump(addr1);
        dump(addr2);
    }
}
