struct DeepNested {
    opt1: Int?;
    inner: InnerDeep?;
}

struct InnerDeep {
    opt2: Int?;
    flag: Bool;
}

contract OptionalDeep {
    d: DeepNested?;

    init() {
        self.d = null;
    }
}