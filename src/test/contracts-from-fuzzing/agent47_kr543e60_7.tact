struct MixedOptionals {
    intOpt: Int?;
    strOpt: String?;
    boolOpt: Bool?;
    structOpt: Inner?;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract MixedOptionalContract {
    mixed: MixedOptionals;

    init() {
        self.mixed = MixedOptionals{
            intOpt: null,
            strOpt: null,
            boolOpt: null,
            structOpt: null,
        };
    }
}