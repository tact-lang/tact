struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{
                a: 1,
                b: false,
                c: "text",
            },
            flag: true,
        };
    }
}