struct DeepLevel {
    inner: Int;
}

struct MiddleLevel {
    level: DeepLevel;
}

contract OptionalMid {
    mid: MiddleLevel?;
    init() {
        self.mid = null;
    }
}