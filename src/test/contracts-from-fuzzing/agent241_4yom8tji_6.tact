struct DeepOptional {
    nestedOpt: Int?;
}

struct WrapDeepOpt {
    wrapperOpt: DeepOptional?;
}

contract OptionalOfStructWithOptional {
    obj: WrapDeepOpt = WrapDeepOpt{ wrapperOpt: null };

    init() {
        self.obj = WrapDeepOpt{ wrapperOpt: DeepOptional{ nestedOpt: 7 } };
    }
}