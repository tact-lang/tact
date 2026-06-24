struct DeepOptional {
    val: Int?;
    next: NextLevel?;
}

struct NextLevel {
    flag: Bool;
    note: String?;
}

contract OptionalChain {
    inner: DeepOptional;
    init() {
        self.inner = DeepOptional{ val: null, next: null };
    }
}