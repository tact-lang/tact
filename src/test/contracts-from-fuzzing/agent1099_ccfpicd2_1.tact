struct DeepInner {
    val: Int;
    opt: Bool?;
}

struct Inner {
    a: Int;
    b: DeepInner;
}

struct Outer {
    s: Inner;
    f: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            s: Inner{
                a: 5,
                b: DeepInner{
                    val: 42,
                    opt: null,
                },
            },
            f: true,
        };
    }
}