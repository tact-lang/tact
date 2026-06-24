struct DeepOptional {
    inner: Int?;
}

struct MiddleOptional {
    deep: DeepOptional?;
    value: Int;
}

struct RootOpt {
    mid: MiddleOptional?;
    flag: Bool;
}

contract OptTest {
    s: RootOpt;

    init() {
        self.s = RootOpt{
            mid: null,
            flag: true
        };
    }
}
