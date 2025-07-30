/// Test Case: Valid usage of initOf and codeOf on a contract with an implicit empty init()
contract A {
    receive() {}
}

contract TestA {
    receive() {
        let s: StateInit = initOf A();
        let c: Cell = codeOf A;
    }
}
