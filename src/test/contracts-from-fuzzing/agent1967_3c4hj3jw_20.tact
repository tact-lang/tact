contract TestContract {
    nested: Outer;
    init() {
        self.nested = Outer{
            inner: Middle{
                leaf: Leaf{
                    a: 1,
                    b: 2,
                    c: null,
                    d: "xyz"
                },
                flag: true
            },
            count: 99
        };
    }
}

struct Outer {
    inner: Middle;
    count: Int;
}

struct Middle {
    leaf: Leaf;
    flag: Bool;
}

struct Leaf {
    a: Int;
    b: Int as uint8;
    c: Int?;
    d: String;
}