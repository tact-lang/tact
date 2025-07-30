struct Nested {
    field: Int;
}

struct Middle {
    nested: Nested;
}

struct Outer {
    middle: Middle;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                nested: Nested{
                    field: 42
                }
            }
        };
    }
}