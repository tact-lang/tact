struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    nested: Inner;
    amount: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{flag: false, count: 99},
            amount: 123
        };
    }
}