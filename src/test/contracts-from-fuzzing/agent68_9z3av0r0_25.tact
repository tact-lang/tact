struct Inner {
    s: String;
    b: Bool;
}

struct Outer {
    i: Int;
    nested: Inner?;
}

contract NullInnerStruct {
    storage: Outer;

    init() {
        self.storage = Outer{
            i: 99,
            nested: null
        };
    }
}