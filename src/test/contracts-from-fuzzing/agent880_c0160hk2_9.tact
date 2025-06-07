struct NestedOptional {
    x: Int?;
    y: Sub?;
}

struct Sub {
    z: Bool;
}

contract OptNestedTest {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            x: null,
            y: Sub{
                z: true,
            },
        };
    }
}