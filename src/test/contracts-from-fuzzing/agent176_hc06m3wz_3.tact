struct InnerMost {
    a: Int;
}

struct Middle {
    mid: InnerMost;
    flag: Bool;
}

struct Outer {
    m: Middle;
    text: String;
}

contract DeepNestedTest {
    storage: Outer = Outer{
        m: Middle{ mid: InnerMost{ a: 7 }, flag: false },
        text: "hello"
    };

    init() {
        self.storage = Outer{
            m: Middle{ mid: InnerMost{ a: 100 }, flag: true },
            text: "bye"
        };
    }
}