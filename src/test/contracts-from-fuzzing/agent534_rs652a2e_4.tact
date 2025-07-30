struct Nested {
    x: Int;
    y: Bool;
}

contract NestedContract {
    coords: Nested;

    init() {
        self.coords = Nested{
            x: 42,
            y: true,
        };
    }
}