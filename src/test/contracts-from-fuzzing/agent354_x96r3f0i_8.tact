struct HasOptionals {
    val1: Int?;
    val2: Bool?;
}

struct HasNestedOptionals {
    nested: HasOptionals?;
}

contract OptionalInOptionalStruct {
    data: HasNestedOptionals;

    init() {
        self.data = HasNestedOptionals{ nested: null };
    }
}
