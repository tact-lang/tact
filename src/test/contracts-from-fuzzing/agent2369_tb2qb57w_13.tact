struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Mid {
    x: Int;
    y: Inner;
}

struct Outer {
    foo: Mid;
    bar: Int;
}

contract NestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            foo: Mid{
                x: 10,
                y: Inner{
                    a: 1,
                    b: true,
                    c: "test"
                }
            },
            bar: 99
        };
    }
}