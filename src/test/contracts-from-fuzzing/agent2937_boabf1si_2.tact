struct Nested {
    x: Int;
    y: Bool;
}

contract TestNestedStruct {
    point: Nested;

    init() {
        self.point = Nested{
            x: 10,
            y: true
        };
    }
}