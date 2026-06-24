struct Inner {
    x: Int?;
}

struct Outer {
    field: Inner?;
}

contract OptionalNestNull {
    s: Outer;

    init() {
        self.s = Outer{
            field: null
        };
    }
}