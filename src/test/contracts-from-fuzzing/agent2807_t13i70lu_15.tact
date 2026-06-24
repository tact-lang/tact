struct Inner {
    foo: Int?;
}

struct Mid {
    x: Inner;
    bar: Bool;
}

contract SkipDeepOptional {
    val: Mid;
    init() {
        self.val = Mid{ x: Inner{}, bar: true };
    }
}