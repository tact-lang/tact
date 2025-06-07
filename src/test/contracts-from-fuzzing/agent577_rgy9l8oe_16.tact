struct OptionalStruct {
    sub: SubStruct?;
}

struct SubStruct {
    value: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            sub: SubStruct{ value: 100 }
        };
    }
}