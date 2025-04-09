struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract Test2 {
    data: Nested;

    init() {
        self.data = Nested{
            x: 5,
            y: false,
            z: "nested"
        };
    }
}