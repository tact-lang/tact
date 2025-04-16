struct NestedOptionals {
    optInt: Int?;
    optInner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract NestedOptTest {
    field: NestedOptionals;

    init() {
        self.field = NestedOptionals{
            optInt: null,
            optInner: null
        };
    }
}