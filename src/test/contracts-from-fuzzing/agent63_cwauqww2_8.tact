struct Inner {
    x: Int;
}

contract Test {
    receive() {
        let i = Inner{x: 5};
    }
}