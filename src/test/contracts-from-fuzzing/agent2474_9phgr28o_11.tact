struct Inner {
    x: Int?;
    y: Bool? = null;
}

struct Outer {
    nested: Inner?;
}

contract MultiLevelOptionals {
    root: Outer?;

    init() {
        self.root = Outer{
            nested: null,
        };
    }
}
