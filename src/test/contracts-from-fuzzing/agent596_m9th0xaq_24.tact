struct SingleOptional {
    a: Int?;
}

contract DefaultNullOpt {
    opt: SingleOptional;

    init() {
        self.opt = SingleOptional{ a: null };
    }
}