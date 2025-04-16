struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{
            x: 1,
            y: false,
            z: "nested"
        };
    }
}