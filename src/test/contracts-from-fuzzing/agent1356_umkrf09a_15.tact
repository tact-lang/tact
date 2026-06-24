struct Container {
    a: Int;
    b: Bool;
}

contract InitOrder {
    one: Container = Container{ a: 10, b: false };
    two: Container;

    init() {
        self.two = Container{ a: 20, b: true };
    }
}
