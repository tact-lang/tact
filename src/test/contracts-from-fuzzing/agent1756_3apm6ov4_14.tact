struct NestedOptionals {
    val1: Int?;
    inside: SubOptional;
}

struct SubOptional {
    val2: Bool?;
    other: String?;
}

contract OptionalNest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            val1: null,
            inside: SubOptional{ val2: null, other: null },
        };
    }
}
