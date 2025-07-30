struct DeepNest {
    inner: InnerStruct;
}

struct InnerStruct {
    info: InfoStruct;
}

struct InfoStruct {
    label: String;
    value: Int;
}

contract DeepTest {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            inner: InnerStruct{
                info: InfoStruct{
                    label: "test",
                    value: 99,
                }
            }
        };
    }
}