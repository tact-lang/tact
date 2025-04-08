struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    maybe: Bool?;
    point: PointStruct;
}

struct PointStruct {
    x: Int;
    y: Int;
}

contract DeepNestedTest {
    deep: DeepNested;
    
    init() {
        self.deep = DeepNested{
            inner: InnerStruct{
                maybe: true,
                point: PointStruct{
                    x: 1,
                    y: 2
                }
            }
        };
    }
}