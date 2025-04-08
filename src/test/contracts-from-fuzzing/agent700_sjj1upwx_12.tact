struct InnerMost {
    a: Int;
    b: Bool?;
    c: String?;
}

struct MiddleLevel {
    one: InnerMost;
    two: InnerMost;
}

contract DeepNest {
    lvl: MiddleLevel?;

    init() {
        self.lvl = null;
    }
}