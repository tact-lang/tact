struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested: Inner;
    num: Int;
    flag: Bool;
}

contract TestContract {
    payload: Outer;
    init() {
        self.payload = Outer{
            nested: Inner{ foo: 5, bar: true },
            num: 42,
            flag: false
        };
    }
}