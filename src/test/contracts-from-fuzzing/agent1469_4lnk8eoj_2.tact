struct InnerNested {
    deep: Int;
    optDeep: Int?;
}

struct Inner {
    val1: Bool;
    val2: Int?;
    nested: InnerNested;
    optNested: InnerNested?;
}

contract NestedStructsStorage {
    data: Inner;

    init() {
        self.data = Inner{
            val1: true,
            val2: null,
            nested: InnerNested{ deep: 123, optDeep: null },
            optNested: null,
        };
    }
}