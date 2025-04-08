struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    number: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{value: 42},
            flag: true,
            number: 123
        };
    }
}