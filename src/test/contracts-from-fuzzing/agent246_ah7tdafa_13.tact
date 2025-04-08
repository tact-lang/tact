struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructHolder {
    dat: OptionalStruct;
    init() {
        self.dat = OptionalStruct{
            inner: null
        };
    }
}