struct InnerMost {
    s: String;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    m: Middle;
    z: Int;
}

contract DeepStore {
    data: Outer;
    init() {
        self.data = Outer{
            m: Middle{ im: InnerMost{ s: "ok" } },
            z: 11
        };
    }
}