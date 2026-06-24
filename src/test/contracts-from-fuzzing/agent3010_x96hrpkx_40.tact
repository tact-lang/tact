struct WrapperOpt {
    nested: Int?;
}

contract OptionalWrapper {
    f: WrapperOpt;

    init() {
        self.f = WrapperOpt{ nested: null };
    }
}
