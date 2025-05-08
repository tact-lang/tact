struct DeepNest {
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool;
    text: String;
    data: Cell;
}

contract ComplexNestedStorage {
    field: DeepNest;

    init() {
        self.field = DeepNest{
            inner: Inner{
                num: 1,
                flag: true,
                text: "hi",
                data: emptyCell(),
            },
            optInner: null,
        };
    }
}