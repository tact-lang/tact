struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner?;
    flag: Bool;
}

contract Test {
    store: Outer;

    init() {
        self.store = Outer{
            nested: Inner{value:42},
            flag: true
        };
    }
}