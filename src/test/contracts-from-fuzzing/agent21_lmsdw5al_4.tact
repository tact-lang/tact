contract A {
    receive() {
         let s = initOf B();
         let addr = contractAddress(s);
    }
    init() {}
}

contract B {
    receive() {
         let s = initOf A();
         let addr = contractAddress(s);
    }
    init() {}
}
