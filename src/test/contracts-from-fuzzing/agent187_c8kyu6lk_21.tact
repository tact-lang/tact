struct Outer {
    val: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    deepInner: InnerMostStruct;
}

struct InnerMostStruct {
    bar: Int = 999;
}

contract StorageNestedDefaultsTest {
    data: Outer;

    init() {
        self.data = Outer{
            val: 123,
            inner: InnerStruct{
                foo: 456,
                deepInner: InnerMostStruct{}
            }
        };
    }
}