contract B {
    init(x: Int) {
        // initialize state
    }
    receive() {}
}

contract Tester4 {
    receive() {
         let s = initOf B(10);
         let c = codeOf B;
    }
}
