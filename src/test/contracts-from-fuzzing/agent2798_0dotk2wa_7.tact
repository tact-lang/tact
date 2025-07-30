struct OptionalMix {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    nested: NestedOptional?;
}

struct NestedOptional {
    val: Int;
    flag: Bool;
}

contract OptionalMixContract {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            intVal: 5,
            boolVal: null,
            strVal: "test",
            nested: null
        };
    }
}