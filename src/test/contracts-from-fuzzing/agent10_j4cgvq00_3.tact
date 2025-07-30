contract C {}

contract Test {
    receive() {
        let s = initOf C();
        let c = codeOf C;
    }
}
