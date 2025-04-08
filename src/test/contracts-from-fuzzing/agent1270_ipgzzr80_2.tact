struct DeepNested {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: DeepNested;
    s: String;
    flag: Bool;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: DeepNested{
                a: 123,
                b: false
            },
            s: "deep test",
            flag: true
        };
    }
}