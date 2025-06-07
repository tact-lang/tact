struct NestedWithOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool?;
    count: Int;
}

contract NestedOptionalContract {
    ns: NestedWithOptionals;

    init() {
        self.ns = NestedWithOptionals{
            inner: InnerStruct{ flag: false, count: 10 }
        };
    }
}