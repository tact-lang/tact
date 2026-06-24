struct OptionalStruct {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            nested: null,
        };
    }
}