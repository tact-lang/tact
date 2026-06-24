struct Inner {
    n: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    s: String;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                n: 7,
                flag: true,
            },
            s: "hello",
        };
    }
}