struct MixOptNested {
    innerOpt: InnerStruct?;
    flag: Bool;
}

struct InnerStruct {
    num: Int;
    description: String?;
}

contract MixedOptionalNested {
    details: MixOptNested;

    init() {
        self.details = MixOptNested{
            innerOpt: null,
            flag: true
        };
    }
}
