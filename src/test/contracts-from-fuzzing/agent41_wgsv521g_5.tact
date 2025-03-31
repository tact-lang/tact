contract CircularA {
    init() {
         // Circular reference: using initOf to get initial state of CircularB
         let s = initOf CircularB();
    }
    receive() {}
}

contract CircularB {
    init() {
         // Circular reference: using initOf to get initial state of CircularA
         let s = initOf CircularA();
    }
    receive() {}
}
