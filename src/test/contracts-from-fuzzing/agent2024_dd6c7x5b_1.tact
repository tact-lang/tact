struct Nested {
    a: Int;
    b: Bool;
    s: String;
}

contract TestDeepNested {
    param: Nested;

    init() {
        self.param = Nested{
            a: 1,
            b: true,
            s: "x"
        };
    }
}