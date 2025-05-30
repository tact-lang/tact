struct HasOptionalStruct {
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
}

contract OptionalStructField {
    s: HasOptionalStruct;

    init() {
        self.s = HasOptionalStruct{
            innerOpt: Inner{ x: 7 }
        };
    }
}
