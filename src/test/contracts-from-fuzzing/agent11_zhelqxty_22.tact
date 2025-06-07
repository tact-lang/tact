fun id(x: Int): Int {
    return x;
}

contract Test {
    receive() {
        let y = id(123);
    }
}