struct NestedOptionals {
    inner: OptionalStruct?;
}

struct OptionalStruct {
    data1: Int;
    data2: Bool?;
}

contract NestedOptTest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: null
        };
    }
}