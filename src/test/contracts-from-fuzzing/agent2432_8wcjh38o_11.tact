struct InnerMost {
    val: Int;
}

struct MidOptional {
    val: InnerMost?;
}

contract Test {
    x: MidOptional;
    init() {
        self.x = MidOptional{ val: null };
    }
}