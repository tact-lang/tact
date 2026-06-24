struct NestedOptional {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: String?;
}

contract Test {
    value: NestedOptional;

    init() {
        self.value = NestedOptional{
            a: null,
            b: Inner{
                x: 11,
                y: null
            }
        };
    }
}