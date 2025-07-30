struct Inner {
    num: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    text: String;
    boolean: Bool;
}

contract DeepNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{ num: 42, flag: false },
            text: "hello",
            boolean: true
        };
    }
}