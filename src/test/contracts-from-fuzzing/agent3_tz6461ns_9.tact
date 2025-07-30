fun test(): Int {
    let x: Int = -1;
    return x;
}

contract Test {
    receive() {
        test();
    }
}
