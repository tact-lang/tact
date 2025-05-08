struct ChildStruct {
    a: Bool;
    b: Int?;
}

struct ParentStruct {
    c: String?;
    d: ChildStruct;
    e: ChildStruct?;
}

contract OptionalMix {
    s: ParentStruct;

    init() {
        self.s = ParentStruct{
            c: null,
            d: ChildStruct{ a: false, b: null },
            e: null
        };
    }
}