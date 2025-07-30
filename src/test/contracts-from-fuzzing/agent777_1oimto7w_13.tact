struct S1 {
    x: Int;
    y: String;
}

struct S2 {
    nested: S1?;
    flag: Bool;
}

contract StructWithOptionalNested {
    data: S2;

    init() {
        self.data = S2{
            nested: S1{ x: 44, y: "foo" },
            flag: false,
        };
    }
}