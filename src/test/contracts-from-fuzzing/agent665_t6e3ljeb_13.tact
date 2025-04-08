struct OptionalStruct {
    optInner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestOptStruct {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optInner: null
        };
    }
}
