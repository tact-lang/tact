struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    some: Inner?;
    num: Int;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            some: Inner{
                a: 12,
                b: false,
            },
            num: 99,
        };
    }
}