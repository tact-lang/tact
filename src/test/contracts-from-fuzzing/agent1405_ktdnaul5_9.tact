struct OptNested {
    innerOpt: Int?;
    str: String;
}

contract StructWithOptionalAndDefault {
    s: OptNested;

    init() {
        self.s = OptNested{
            innerOpt: null,
            str: "abc"
        };
    }
}