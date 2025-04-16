contract A {
    init() { }
}

contract Test {
    receive() {
         let addr: Address = contractAddress(initOf A());
    }
}
