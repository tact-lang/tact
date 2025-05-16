struct InnerStruct {
    value: Int = 5;
}

struct WrapperStruct {
    inner: InnerStruct?;
}

contract TestContract {
    field: WrapperStruct;

    init() {
        self.field = WrapperStruct{
            inner: InnerStruct{}
        };
    }
}