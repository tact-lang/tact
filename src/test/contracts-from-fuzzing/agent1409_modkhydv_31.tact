// test optional struct with optional inside
struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct WrapperOpt {
    inner: DeepOpt?;
}

contract Test {
    w: WrapperOpt?;
    init() {
        self.w = null;
    }
    receive() { let _ = self.w; }
}