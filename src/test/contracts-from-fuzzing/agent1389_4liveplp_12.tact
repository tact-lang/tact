struct Nested {
    innerInt: Int;
    innerStr: String;
}

contract MultipleNested {
    x: Nested;
    y: Nested;

    init() {
        self.x = Nested{ innerInt: 1, innerStr: "first" };
        self.y = Nested{ innerInt: 2, innerStr: "second" };
    }
}