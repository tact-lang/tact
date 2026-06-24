contract A {}

contract Test {
    receive() {
        let s = initOf A();
        let c = codeOf A;
    }
}
