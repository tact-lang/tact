struct OptStruct {
    maybeStr: InnerStruct?;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    rec: OptStruct;

    init() {
        self.rec = OptStruct{
            maybeStr: null
        };
    }
}
