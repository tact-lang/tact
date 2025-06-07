struct DeepMix {
    inner: InnerStruct;
}

struct InnerStruct {
    field1: Bool;
    field2: Int?;
    field3: String;
}

contract MixedDeep {
    storage: DeepMix;

    init() {
        self.storage = DeepMix{
            inner: InnerStruct{
                field1: true,
                field2: null,
                field3: "test"
            }
        };
    }
}