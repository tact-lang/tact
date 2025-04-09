struct Nested {
    x: Int = 1;
    y: Bool = false;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{};
    }

    receive() {
        dump(self.n.x);
    }
}