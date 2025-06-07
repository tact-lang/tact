// Optional struct with deep nested optional field
struct DeepOpt {
    maybeInner: Inner?;
}

struct Inner {
    num: Int?;
}

contract TestDeepOpt {
    data: DeepOpt?;

    init() {
        self.data = null;
    }

    receive() {}
}