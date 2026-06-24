trait T {
    x: Int;
}

contract C with T {
    x: Int;

    init() {
        self.x = 123;
    }
}