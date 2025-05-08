struct OptionalStruct {
    s: Inner?;
}

struct Inner {
    val: Int;
}

contract Test9 {
    optStruct: OptionalStruct;

    init() {
        self.optStruct = OptionalStruct{ s: null };
    }
}
