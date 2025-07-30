struct OnlyOption {
    foo: Int?;
}

contract OptionalInit {
    opt: OnlyOption;
    init() {
        self.opt = OnlyOption{ foo: null };
    }
}