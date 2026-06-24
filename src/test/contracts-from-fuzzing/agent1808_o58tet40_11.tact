struct OptInOpt {
    innerOpt: Int?;
    text: String;
}

struct OuterWithOpt {
    inner: OptInOpt?;
    flag: Bool;
}

contract OptionalInOptional {
    storage: OuterWithOpt;

    init() {
        self.storage = OuterWithOpt{
            inner: OptInOpt{ innerOpt: null, text: "abc" },
            flag: true
        };
    }
}