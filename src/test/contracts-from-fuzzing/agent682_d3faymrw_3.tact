struct Inner {
    n: Int;
    s: String;
    flag: Bool?;
}

struct Outer {
    inner: Inner;
    more: Bool;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{
                n: 1,
                s: "hi",
                flag: null,
            },
            more: true,
        };
    }
}