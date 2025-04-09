struct NestedOptional {
    a: Int?;
    b: Nested2?;
}

struct Nested2 {
    c: Int;
    d: Bool;
}

contract TestDeepOptionals {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: Nested2{
                c: 42,
                d: true
            }
        };
    }
}