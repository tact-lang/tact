struct S {
    x: Int;
    y: Bool?;
    z: String;
}

contract Test {
    field: S;

    init() {
        self.field = S{ x: 7, y: null, z: "abc" };
    }
}