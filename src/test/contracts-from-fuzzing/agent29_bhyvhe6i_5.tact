struct Outer {
    inner: Int;
    y: Int;
}

contract Test {
    receive() {
        let o: Outer = Outer{ inner: 1, y: 2 };
    }
}