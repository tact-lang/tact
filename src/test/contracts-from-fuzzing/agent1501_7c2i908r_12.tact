struct RecA {
    foo: Int;
    sub: RecB;
}

struct RecB {
    bar: Int;
    baz: Int;
}

contract TestContract {
    val: RecA;

    init() {
        self.val = RecA{
            foo: 12,
            sub: RecB{
                bar: 34,
                baz: 56,
            },
        };
    }
}