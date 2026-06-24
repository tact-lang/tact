struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    text: String?;
}

contract TestDeepOpt {
    val: DeepOpt;

    init() {
        self.val = DeepOpt {
            inner: null,
        };
    }
}
