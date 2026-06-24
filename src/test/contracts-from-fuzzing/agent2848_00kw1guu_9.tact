struct NestedWithOptionals {
    inner: InnerNested?;
}

struct InnerNested {
    flag: Bool?;
    num: Int?;
}

contract DeepOptionals {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            inner: null
        };
    }
}