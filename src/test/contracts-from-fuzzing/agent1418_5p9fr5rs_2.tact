struct Nested1 {
    x: Int;
    y: Bool;
}

contract NestedStructStorage {
    s: Nested1;

    init() {
        self.s = Nested1{
            x: 10,
            y: true,
        };
    }
}