struct InnerMost {
    val: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
    flag: Bool?;
}

struct OuterOptional {
    mid: MiddleOpt?;
    ready: Bool;
}

contract OptNested {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            mid: null,
            ready: true
        };
    }
}