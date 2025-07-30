struct Nested {
    n1: Int;
    n2: Bool;
}

struct Outer {
    m: Nested;
    opt: Bool?;
}

contract DeepNested {
    field: Outer;

    init() {
        self.field = Outer{
            m: Nested{n1: 1, n2: true},
            opt: null
        };
    }
}