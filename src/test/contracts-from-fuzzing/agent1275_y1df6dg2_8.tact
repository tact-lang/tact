struct MultiOptional {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
}

struct NestedMultiOptional {
    mo1: MultiOptional;
    mo2: MultiOptional;
}

contract TestMultiOpt {
    nested: NestedMultiOptional;

    init() {
        self.nested = NestedMultiOptional{
            mo1: MultiOptional{ intVal: 1, boolVal: null, strVal: null },
            mo2: MultiOptional{ intVal: null, boolVal: true, strVal: "abc" },
        };
    }
}