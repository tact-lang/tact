struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
}

contract OptionalStructContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            inner: InnerStruct{
                flag: true
            }
        };
    }
}