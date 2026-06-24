struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    num: Int;
}

contract OptionalNested {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            inner: Inner{
                num: 99
            }
        };
    }
}