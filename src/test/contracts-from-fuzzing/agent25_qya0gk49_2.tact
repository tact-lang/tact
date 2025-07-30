contract A {
    receive() {}
}

contract Caller {
    receive() {
        // Valid usage: no parameters contract, using initOf and codeOf
        let initCell = initOf A();
        let codeCell = codeOf A;
    }
}
