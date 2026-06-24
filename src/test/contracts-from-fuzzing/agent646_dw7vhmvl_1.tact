struct NestedDeep {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract DeepNestedTest {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            inner: InnerStruct{
                val1: 1,
                val2: true
            }
        };
    }
}