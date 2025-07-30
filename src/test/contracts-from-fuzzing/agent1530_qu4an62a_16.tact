struct StructInsideOptional {
    n: Int;
}

contract OptionalStructField {
    opt_struct: StructInsideOptional?;

    init() {
        self.opt_struct = StructInsideOptional{n: 111};
    }
}