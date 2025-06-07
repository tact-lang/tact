struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    point: PointStruct;
}

struct PointStruct {
    x: Int;
    y: Int;
}

contract NestedContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                flag: true,
                point: PointStruct{
                    x: 10,
                    y: 20,
                }
            }
        };
    }
}