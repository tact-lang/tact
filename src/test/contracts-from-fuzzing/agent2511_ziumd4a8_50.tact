struct InnerMost {
    s: String;
}

struct Inner {
    mid: InnerMost;
}

contract DeepPtr {
    val: Inner;

    init() {
        self.val = Inner{
            mid: InnerMost{ s: "hi" }
        };
    }
}