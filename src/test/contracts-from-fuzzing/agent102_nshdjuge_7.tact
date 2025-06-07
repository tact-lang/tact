struct InnerOptional {
    val: String?;
    flag: Bool;
}

contract OptionalStructFieldTest {
    innerOpt: InnerOptional?;

    init() {
        self.innerOpt = InnerOptional{
            val: null,
            flag: true
        };
    }
}
