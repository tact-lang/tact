struct OptionalNesting {
    x: Int?;
    s: SubStruct?;
}

struct SubStruct {
    y: Int;
}

contract OptNested {
    val: OptionalNesting;

    init() {
        self.val = OptionalNesting{
            x: null,
            s: SubStruct{ y: 5 }
        };
    }
}