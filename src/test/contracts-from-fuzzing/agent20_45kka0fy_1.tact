struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
    desc: String?;
}

struct Outer {
    middle: Middle;
    count: Int?;
    note: String;
}

contract NestedPersistent {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    x: 42,
                    y: true,
                },
                flag: false,
                desc: null,
            },
            count: null,
            note: "Deep test"
        };
    }
}