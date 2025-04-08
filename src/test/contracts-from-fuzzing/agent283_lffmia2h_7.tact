struct InnerMost { val: Int }

struct Mid {
    label: String;
    midVal: InnerMost;
}

struct Inner {
    intVal: Int;
    boolVal: Bool;
    midStruct: Mid;
}

contract NestedInner {
    d: Inner;

    init() {
        self.d = Inner {
            intVal: 77,
            boolVal: true,
            midStruct: Mid {
                label: "deep",
                midVal: InnerMost { val: 99 }
            }
        };
    }
}