struct InnerMost {
    value: Int;
}

struct Middle1 {
    im: InnerMost?;
    flag: Bool;
}

struct Middle2 {
    m1: Middle1?;
    s: String;
}

contract DeepOptNest {
    nested: Middle2;

    init() {
        self.nested = Middle2{
            m1: Middle1{ im: InnerMost{ value: 77 }, flag: true },
            s: "ok"
        };
    }
}