struct OptionNested {
    nested: InnerOpt?;
}

struct InnerOpt {
    boolVal: Bool;
    intVal: Int;
}

contract OptionalNestedStruct {
    val: OptionNested;

    init() {
        self.val = OptionNested{nested: null};
    }
}