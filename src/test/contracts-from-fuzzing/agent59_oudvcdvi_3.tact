struct OptionalStruct {
    number: Int?;
    flag: Bool?;
    nested: AnotherStruct?;
}

struct AnotherStruct {
    val: Int;
}

contract OptionalContract {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{
            number: null,
            flag: null,
            nested: null
        };
    }
}