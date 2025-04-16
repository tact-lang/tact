/* Test 2: Multi-level Chain Initialization */

contract A {
    init() { }
}

contract B {
    init() { let dummy = initOf A(); }
}

contract C {
    fun test(): Int {
         let sA = initOf A();
         let sB = initOf B();
         return 1;
    }
}
