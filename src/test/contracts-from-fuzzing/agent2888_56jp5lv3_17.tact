// Optional struct with optional inner optional string
struct Inner {
    message: String?;
}

contract OptionalDeep {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}