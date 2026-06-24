/* Test 1: Cycle Dependency between contracts A and B */
contract A {
    init() {
        let s = initOf B();
    }
}

contract B {
    init() {
        let s = initOf A();
    }
}
