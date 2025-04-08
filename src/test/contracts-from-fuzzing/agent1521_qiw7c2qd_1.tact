struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 1,
                b: "hi",
            },
            flag: true,
        };
    }
}