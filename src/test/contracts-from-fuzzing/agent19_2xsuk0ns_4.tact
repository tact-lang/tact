/* Test 4: Mutual dependency between two contracts using initOf */

contract A {
    init() {}
    get fun test(): Int {
         let sB: StateInit = initOf B();
         return 10;
    }
}

contract B {
    init() {}
    get fun test(): Int {
         let sA: StateInit = initOf A();
         return 20;
    }
}
