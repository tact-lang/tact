struct OptionalStructs {
    foo: Inner?;
    bar: Inner?;
}

struct Inner {
    val: Int;
}

contract MultiOptStruct {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            foo: Inner{ val:1 },
            bar: null
        };
    }
}
