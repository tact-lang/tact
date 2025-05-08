struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: String;
    optInner: DeepInner?;
}

struct DeepInner {
    deepVal: Int;
    flag: Bool;
}

contract DeepNestedTest {
    nestedField: Nested;
    
    init() {
        self.nestedField = Nested{
            inner: InnerStruct{
                val1: 123,
                val2: true,
                val3: "hello",
                optInner: DeepInner{
                    deepVal: 42,
                    flag: false
                }
            }
        };
    }
}