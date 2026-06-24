struct DeepInner {
    x: Int;
}

struct MidLayer {
    mid: DeepInner?;
}

struct TopLevel {
    top: MidLayer;
}

contract Test {
    val: TopLevel;
    init() {
        self.val = TopLevel{ top: MidLayer{ mid: null } };
    }
}