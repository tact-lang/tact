struct RecursiveInner {
    value: Int;
}

struct RecursiveOuter {
    opt: RecursiveInner?;
}

contract OptionalContainingStruct {
    info: RecursiveOuter;

    init() {
        self.info = RecursiveOuter{
            opt: RecursiveInner{ value: 42 }
        };
    }
}