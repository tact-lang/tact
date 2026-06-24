struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedHolder {
    data: Nested;

    init() {
        self.data = Nested{ x: 7, y: true, z: "hi" };
    }
}