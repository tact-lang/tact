struct DeepInner {
    k: Bool;
    s: String;
}

struct Outer {
    a: Int;
    b: DeepInner;
}

contract TestContract {
    nested: Outer;
    init() {
        self.nested = Outer{
            a: 1,
            b: DeepInner{
                k: true,
                s: "deep"
            }
        };
    }
}