struct Inner {
    x: Int;
}

struct WrapOpt {
    wrapped: Inner?;
}

contract OptionalStructInStruct {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            wrapped: null
        };
    }
}
