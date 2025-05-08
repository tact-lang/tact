struct Inner {
    depth: Int;
}

struct Outer {
    inner: Inner;
    optInner: Inner?;
    val: Int;
    flag: Bool;
    text: String;
}

contract DeepNested {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Inner{ depth: 1 },
            optInner: null,
            val: 42,
            flag: true,
            text: "hello"
        };
    }
}
