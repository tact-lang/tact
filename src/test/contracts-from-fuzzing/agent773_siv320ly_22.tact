struct StringOptional {
    s: String?;
}

contract JustOneOpt {
    opt: StringOptional;

    init() {
        self.opt = StringOptional{
            s: null,
        };
    }
}