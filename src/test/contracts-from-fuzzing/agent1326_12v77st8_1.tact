struct Inner {
    f1: Int;
    f2: Bool?;
}

struct Outer {
    nested: Inner;
    num: Int;
}

contract NestedStructStorage {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{f1: 10, f2: true},
            num: 7,
        };
    }
}