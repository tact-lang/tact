struct DeepNested {
    a: Bool;
    b: Inner;
}

struct Inner {
    c: Bool;
    d: Innermost;
}

struct Innermost {
    e: Bool;
    f: Int;
}

contract TestContract {
    s: DeepNested;
    init() {
        self.s = DeepNested{
            a: true,
            b: Inner{
                c: false,
                d: Innermost{ e: true, f: 123 }
            }
        };
    }
}