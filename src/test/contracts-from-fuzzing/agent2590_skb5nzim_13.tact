struct OptionalStruct {
    data: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract OptionalStructContract {
    st: OptionalStruct;
    init() {
        self.st = OptionalStruct{ data: null };
    }
}