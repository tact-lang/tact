struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Outer {
    x: NestedOptional?;
}

contract OptionalOfStructTest {
    outer: Outer;

    init() {
        self.outer = Outer{
            x: null
        };
    }
}