struct DeeplyNested {
    flag: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    optionalBool: Bool?;
}

contract DeepTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            flag: true,
            inner: InnerStruct{
                val: 42,
                optionalBool: null
            }
        };
    }
}