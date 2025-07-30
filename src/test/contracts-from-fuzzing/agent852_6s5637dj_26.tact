struct WithOptional {
    s: String?;
}

struct Wrapper {
    f1: Int;
    inner: WithOptional;
    f2: Bool;
}

contract OptionalInMidStruct {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            f1: 1,
            inner: WithOptional{ s: null },
            f2: true
        };
    }
}