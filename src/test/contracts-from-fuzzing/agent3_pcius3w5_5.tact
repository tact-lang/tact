/* Snippet 5: Circular dependency between two contracts using initOf
   This snippet creates a circular dependency between contracts A and B.
*/

contract A {
    init() {
        let stateB: StateInit = initOf B();
    }
}

contract B {
    init() {
        let stateA: StateInit = initOf A();
    }
}
