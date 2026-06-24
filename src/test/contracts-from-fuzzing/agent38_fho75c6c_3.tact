struct DeepInner {
    flag: Bool;
    count: Int;
}

struct Outer {
    inner: DeepInner;
    description: String;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: DeepInner{ flag: true, count: 100 },
            description: "desc"
        };
    }
}