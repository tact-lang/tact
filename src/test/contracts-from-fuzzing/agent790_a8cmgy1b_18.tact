struct InnerMost {
    i: Int?;
    s: String;
}

struct MidLayer {
    x: Bool;
    y: InnerMost;
}

contract OptionalMidNested {
    m: MidLayer?;

    init() {
        self.m = null;
    }
}
