struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract TestContract {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{
            a: null,
            b: true,
            c: InnerStruct{x: 42}
        };
    }
}