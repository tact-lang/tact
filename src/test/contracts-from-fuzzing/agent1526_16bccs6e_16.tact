struct InnerS {
    a: Int;
}
struct MidS {
    s: InnerS;
}

contract OptionalMid {
    m: MidS?;

    init() {
        self.m = null;
    }
}