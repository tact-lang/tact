// Deep optional chain: optional struct containing optional struct
struct InnerMost {
    z: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract DeepOptional {
    top: OuterOpt;

    init() {
        self.top = OuterOpt{middle: null};
    }
}