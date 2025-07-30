struct Sub {
    s1: Int;
    s2: Bool;
}

struct Top {
    t1: Sub;
    t2: Sub?;
}

contract DeepOptional {
    foo: Top?;

    init() {
        self.foo = null;
    }
}