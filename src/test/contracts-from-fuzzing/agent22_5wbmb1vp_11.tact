struct OptionalStruct {
    a: Int;
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    val: String;
    flag: Bool;
}

contract TestContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a: 1,
            nestedOpt: null
        };
    }
}