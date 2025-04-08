struct DeepInner {
    a: Int;
    b: Bool;
}

struct MidLevel {
    x: Int;
    y: DeepInner;
}

struct TopLevel {
    m: MidLevel;
    flag: Bool;
    s: String;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            m: MidLevel{ x: 7, y: DeepInner{ a: 3, b: false } },
            flag: true,
            s: "hello"
        };
    }
}