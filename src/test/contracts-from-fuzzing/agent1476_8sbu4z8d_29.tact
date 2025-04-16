struct DoubleOptional {
    val: Int?;
    txt: String?;
}

contract StructDoubleOptPersistent {
    s: DoubleOptional;

    init() {
        self.s = DoubleOptional{
            val: null,
            txt: null,
        };
    }
}