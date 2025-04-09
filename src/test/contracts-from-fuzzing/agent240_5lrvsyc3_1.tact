struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    value: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            value: 42,
            nested: Inner{
                flag: true,
                count: 7,
            }
        };
    }
}