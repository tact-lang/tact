contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        // Test valid usage: contract with empty init
        let si = initOf A();
        let co = codeOf A;
    }
}
