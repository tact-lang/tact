struct Inner {
    value1: Int;
    value2: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                value1: 111,
                value2: true,
            },
            flag: false,
        };
    }
}