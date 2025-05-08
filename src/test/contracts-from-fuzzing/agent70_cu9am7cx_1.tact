struct Nested {
    x: Int;
    y: Bool;
    z: String?;
}

contract StructInState {
    st: Nested;

    init() {
        self.st = Nested{
            x: 1,
            y: true,
            z: null
        };
    }
}
