struct SomeNested {
    val: Int?;
}

struct AllOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optNested: SomeNested?;
}

contract AllOptionalKinds {
    store: AllOptionals;

    init() {
        self.store = AllOptionals{
            optInt: null,
            optBool: null,
            optString: null,
            optNested: null,
        };
    }
}