struct NestedOptionalsStruct {
    inner: InnerOptionals;
}

struct InnerOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
}

contract Test {
    data: NestedOptionalsStruct;

    init() {
        self.data = NestedOptionalsStruct{
            inner: InnerOptionals{
                a: null,
                b: null,
                c: null,
                d: null,
                e: null
            }
        };
    }
}