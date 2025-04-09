struct OptionalStruct {
    innerOpt: OptStruct?;
}

struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    f: OptionalStruct;

    init() {
        self.f = OptionalStruct{
            innerOpt: OptStruct{
                x: null,
                y: null
            }
        };
    }
}