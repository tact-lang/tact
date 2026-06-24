struct NestedOptionalsTest {
    innerOpt: Int?; // optional Int
    strOpt: String?; // optional String
    deepOptStruct: DeepOptStruct?; // optional struct
}

struct DeepOptStruct {
    a: Int;
    b: Bool?; // optional Bool
    c: String;
}

contract StorageTest {
    data: NestedOptionalsTest; // deeply nested optionals struct

    init() {
        self.data = NestedOptionalsTest{
            innerOpt: null,
            strOpt: null,
            deepOptStruct: null,
        };
    }
}
