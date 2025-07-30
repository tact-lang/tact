struct Inner {
    a: Int;
    optB: Bool?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ a: 1, optB: true },
            flag: false
        };
    }
}