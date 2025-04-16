contract A {
    init() {
         // Cross-call: A calls B's init via initOf
         let _ = initOf B();
    }
    receive() {}
}

contract B {
    init() {
         // Cross-call: B calls A's init via initOf
         let _ = initOf A();
    }
    receive() {}
}

contract Tester {
    init() {
         // Trigger cross-recursive initialization
         let _ = initOf A();
         let _ = initOf B();
    }
    receive() {}
}
