struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{foo: 1, bar: null},
            flag: true
        };
    }
}