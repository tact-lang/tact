struct OptionalStruct {
    s: Inner?;
}

struct Inner {
    flag: Bool;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            s: null
        };
    }
}