fun compute(): Int {
    return 123;
}

const X: Int = compute();

contract Test {
    receive() {
        X;
    }
}
