struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    x: Inner?;
    y: Int?;
}

contract NestedOptionalStruct {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: null,
            y: null
        };
    }
}