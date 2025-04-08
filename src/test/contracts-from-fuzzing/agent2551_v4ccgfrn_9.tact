struct DeeplyOptional {
    val1: Int?;
    nested: OptionalSubStruct?;
}

struct OptionalSubStruct {
    name: String?;
    flag: Bool?;
}

contract ContractWithOptionalNesting {
    info: DeeplyOptional;

    init() {
        self.info = DeeplyOptional{
            val1: null,
            nested: null
        };
    }
}