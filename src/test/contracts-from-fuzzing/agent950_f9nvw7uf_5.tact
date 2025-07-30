struct OptionalWrap {
    innerOpt: Inner?;
}

struct Inner {
    valOpt: Int?;
}

contract OptWrapTest {
    data: OptionalWrap;

    init() {
        self.data = OptionalWrap{ innerOpt: null };
    }
}