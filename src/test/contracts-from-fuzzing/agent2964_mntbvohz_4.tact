struct OptionalStruct {
    data: SubStruct?;
}

struct SubStruct {
    value: Int;
}

contract OptionalNested {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{
            data: null
        };
    }
}