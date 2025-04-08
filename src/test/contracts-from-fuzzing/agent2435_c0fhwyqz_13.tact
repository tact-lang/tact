struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    data: Int;
}

contract TestContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            inner: Inner{
                data: 999
            }
        };
    }
}