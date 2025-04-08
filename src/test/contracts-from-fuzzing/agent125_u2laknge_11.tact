struct Inner {
    f: Int;
}

struct Outer {
    nested: Inner?;
    num: Int;
}

contract OptNested {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
            num: 999,
        };
    }
}