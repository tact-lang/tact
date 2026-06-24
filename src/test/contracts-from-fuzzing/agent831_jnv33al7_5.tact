struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

struct StructWithNestedOptional {
    x: Int;
    y: NestedOptionals;
    z: Bool;
}

contract ManyNulls {
    data: StructWithNestedOptional;
    init() {
        self.data = StructWithNestedOptional{
            x: 42,
            y: NestedOptionals{ a: null, b: null, c: null, d: null },
            z: true
        };
    }
}