struct NestedStructOptional {
    inner: InnerOptionals;
}

struct InnerOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract NestedOptionalInContract {
    storage: NestedStructOptional;

    init() {
        self.storage = NestedStructOptional{
            inner: InnerOptionals{
                intOpt: 5,
                boolOpt: null,
                stringOpt: null,
            }
        };
    }
}