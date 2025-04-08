struct OptionalStruct {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            innerOpt: InnerStruct{
                a: 10,
                b: true
            }
        };
    }
}