struct OptionalOptionalStruct {
    nested: InnerOptional?;
}

struct InnerOptional {
    val: Int?;
}

contract OptionalOptionalHolder {
    s: OptionalOptionalStruct;

    init() {
        self.s = OptionalOptionalStruct{
            nested: InnerOptional{
                val: null
            }
        };
    }
}