struct OptionalStruct {
    f: InnerStruct?;
}

struct InnerStruct {
    v: Int;
}

contract TestContract {
    st: OptionalStruct;
    init() {
        self.st = OptionalStruct{
            f: null
        };
    }
}
