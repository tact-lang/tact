struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            inner: InnerStruct{
                x: 99,
                y: false
            }
        };
    }
}