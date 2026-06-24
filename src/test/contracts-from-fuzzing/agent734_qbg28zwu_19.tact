struct One {
    foo: Int;
}

struct Two {
    bar: One;
}

struct Three {
    baz: Two;
    val: Int;
}

contract TestContract {
    nestedVal: Three;

    init() {
        self.nestedVal = Three{
            baz: Two{ bar: One { foo: 42 } },
            val: 5
        };
    }
}