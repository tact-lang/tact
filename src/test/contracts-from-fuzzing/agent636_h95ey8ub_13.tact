struct InnerWithDefaults {
    z: Int = 99;
}

struct Outer {
    x: Int;
    y: InnerWithDefaults;
}

contract NestedDefaultStructs {
    s: Outer;

    init() {
        self.s = Outer{
            x: 10,
            y: InnerWithDefaults{}
        };
    }
}