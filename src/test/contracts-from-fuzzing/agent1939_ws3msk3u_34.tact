// optional outer struct containing concrete nested struct
struct Inner {
    x: Int;
}

struct Outer {
    nested: Inner;
}

contract OptStruct {
    s: Outer?;
    init() {
        self.s = Outer{ nested: Inner{ x:123 } };
    }
}