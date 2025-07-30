struct SOptional {
    val: Int?;
}

contract OptFields {
    opt1: SOptional;
    opt2: SOptional;
    opt3: SOptional;

    init() {
        self.opt1 = SOptional{};
        self.opt2 = SOptional{val: 5};
        self.opt3 = SOptional{};
    }
}
