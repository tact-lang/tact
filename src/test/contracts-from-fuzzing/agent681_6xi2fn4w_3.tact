struct Deep {
    inner: Deeper;
}

struct Deeper {
    x: Int;
    y: InnerMost;
}

struct InnerMost {
    flag: Bool;
    message: String;
}

contract DeepNested {
    payload: Deep;

    init() {
        self.payload = Deep{
            inner: Deeper{
                x: 5,
                y: InnerMost{flag: true, message: "hello"}
            }
        };
    }
}
