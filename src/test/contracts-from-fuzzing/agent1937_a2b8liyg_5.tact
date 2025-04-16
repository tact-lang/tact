struct InnerOptional {
    val: Int?;
    flag: Bool?;
}

contract OptionalStructField {
    s: InnerOptional;

    init() {
        self.s = InnerOptional{
            val: null,
            flag: null,
        };
    }
}
