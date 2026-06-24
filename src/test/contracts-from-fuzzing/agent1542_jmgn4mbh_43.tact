struct SInner {
    val: Int as int16;
    flag: Bool = true;
}

struct SOpt {
    nested: SInner;
    txt: String?;
}

contract Test {
    maybe: SOpt?;

    init() {
        self.maybe = null;
    }
}