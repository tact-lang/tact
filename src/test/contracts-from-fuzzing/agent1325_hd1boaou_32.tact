message(0x42) M {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    m: M;

    init() {
        self.m = M{
            foo: 7,
            bar: true
        };
    }

    receive() {
        self.m = M{
            foo: self.m.foo + 1,
            bar: !self.m.bar
        };
    }
}