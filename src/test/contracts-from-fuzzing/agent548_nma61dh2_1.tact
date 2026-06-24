struct NestedOptionals {
    val1: Int?;
    val2: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            val1: null,
            val2: true,
            inner: InnerStruct{ x: 1, y: false }
        };
    }
}