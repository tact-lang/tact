contract C(val: Int) {}

contract TestC {
    receive() {
        let s = initOf C(50);
        let c = codeOf C;
    }
}
