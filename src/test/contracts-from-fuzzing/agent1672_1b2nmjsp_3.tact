struct Inner {
    i: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    str: String;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{
                i: 1,
                b: false,
            },
            str: "nested",
        };
    }
}