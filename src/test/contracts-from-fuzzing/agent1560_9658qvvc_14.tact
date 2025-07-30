struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalOfStruct {
    value: OptionalStruct;
    init() {
        self.value = OptionalStruct{
            inner: Inner{
                x: 5,
                y: true,
            },
        };
    }
}