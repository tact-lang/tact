contract A {
    init(x: Int) {
        // Dummy initialization
    }
    receive() {}
}

contract Test {
    receive() {
        let s = initOf A(42);
        s; // using s to avoid unused variable warning
    }
}