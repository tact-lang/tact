struct OptionalStruct {
    s: Inner?;
}

struct Inner {
    val: Int;
}

contract HasOptionalStruct {
    v: OptionalStruct;

    init() {
        self.v = OptionalStruct{
            s: null
        };
    }
}