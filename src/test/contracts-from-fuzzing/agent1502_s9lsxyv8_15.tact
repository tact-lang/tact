struct Inner {
    a: Int = 7;
    b: Bool = true;
    c: String;
}

struct Outer {
    nested: Inner;
    num: Int;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Inner{
                a: 1,
                b: false,
                c: "abc"
            },
            num: 42
        };
    }
}