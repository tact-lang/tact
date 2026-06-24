message(101) M {
    foo: Int;
}

struct S {
    bar: Bool;
    nestedM: M?;
}

contract TestContract {
    value: S?;

    init() {
        self.value = S{
            bar: true,
            nestedM: M{
                foo: 123
            }
        };
    }
}