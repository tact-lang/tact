struct Inner {
    x: Int;
    y: Bool;
    s: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    count: Int;
}

contract NestedStructs {
    data: Outer = Outer{
        nested: Inner{
            x: 1,
            y: true,
            s: "hi",
        },
        flag: false,
        count: 10,
    };
    init() {
        self.data = Outer{
            nested: Inner{
                x: 2,
                y: false,
                s: "hello",
            },
            flag: true,
            count: 20,
        };
    }
}