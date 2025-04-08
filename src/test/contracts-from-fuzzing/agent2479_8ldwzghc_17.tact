struct DeeplyNestedOptionals {
    intVal: Int?;
    strVal: String?;
    inner: InnerOptional?;
}

struct InnerOptional {
    flag: Bool?;
    owner: Address?;
}

contract OptionalsInNest {
    s: DeeplyNestedOptionals;
    init() {
        self.s = DeeplyNestedOptionals{
            intVal: null,
            strVal: "hi",
            inner: null,
        };
    }
}