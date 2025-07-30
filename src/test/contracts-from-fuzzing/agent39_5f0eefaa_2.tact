contract A {}

contract Test {
    receive() {
        let initCell = initOf A();
        let codeCell = codeOf A;
    }
}
