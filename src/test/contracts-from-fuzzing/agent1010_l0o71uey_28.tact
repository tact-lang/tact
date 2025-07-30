struct InnerOptional {
    val: Int?;
}

contract OptionalsField {
    opt: InnerOptional;
    init() {
        self.opt = InnerOptional{val: null};
    }
}