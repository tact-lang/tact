struct Inner {
    p: Int?;
}
struct Outer {
    x: Int?;
    y: Inner?;
    flag: Bool?;
}

contract NullableNestAll {
    stuff: Outer;

    init() {
        self.stuff = Outer{
            x: null,
            y: null,
            flag: null
        };
    }
}