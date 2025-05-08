message(42) M {
    foo: Int;
    bar: Bool;
}

contract HasMessageField {
    m: M;

    init() {
        self.m = M{
            foo: 1,
            bar: true,
        };
    }
}