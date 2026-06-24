struct OptStruct {
    s: Inner?;
}

struct Inner {
    a: Int;
    b: Int?;
}

contract TestOptionalStruct {
    data: OptStruct;
    init() {
        self.data = OptStruct{
            s: null
        };
    }
}