struct InnerDefault {
    val: Int = 5;
}

struct Holder {
    data: InnerDefault;
    optional: Int?;
}

contract MixingDefaultsOpt {
    s: Holder;

    init() {
        self.s = Holder{
            data: InnerDefault{},
            optional: null,
        };
    }
}