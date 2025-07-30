struct Nested1 {
    x: Int;
    y: Int;
}

struct Nested2 {
    inner: Nested1;
    flag: Bool;
}

contract TestContract {
    field: Nested2;

    init() {
        self.field = Nested2{ inner: Nested1{ x: 1, y: 2 }, flag: true };
    }
}
