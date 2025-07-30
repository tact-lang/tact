struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract UsesStruct {
    param: Nested;

    init() {
        self.param = Nested {
            a: 12,
            b: true,
            c: "hi"
        };
    }
}