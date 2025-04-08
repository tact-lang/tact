struct Inner {
    val: Int as int8;
    optionalStr: String?;
}

struct Middle {
    nested: Inner;
    description: String;
}

struct Outer {
    wrap: Middle;
    active: Bool;
    num: Int;
}

contract MultiLevel {
    data: Outer;

    init() {
        self.data = Outer{
            wrap: Middle{
                nested: Inner{ val: -5, optionalStr: null },
                description: "desc",
            },
            active: true,
            num: 42,
        };
    }
}