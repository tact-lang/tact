contract A {}

contract Test {
    receive() {
        let s = initOf A();
    }
}
