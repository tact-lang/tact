struct OptionalStruct {
    num: Int?;
}

struct DoubleOptionalStruct {
    optStruct: OptionalStruct?;
}

contract OptionalStructHolder {
    s: DoubleOptionalStruct;

    init() {
        self.s = DoubleOptionalStruct{
            optStruct: null,
        };
    }
}