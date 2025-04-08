struct Container {
    i: Int;
    b: Bool;
}

contract InitOrderTest {
    x: Int = 0;
    c: Container = Container{ i: 1, b: true };

    init() {
        self.x = 42;
        self.c = Container{ i: 7, b: false };
    }
}
