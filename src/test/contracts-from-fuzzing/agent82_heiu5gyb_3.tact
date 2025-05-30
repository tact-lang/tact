contract A {
    receive() {}
}

contract Test2 {
    receive() {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf A());
        let codeCmp: Bool = myCode() == codeOf A;
        dump(addr1);
        dump(addr2);
        dump(codeCmp);
    }
}
