struct DeepOptional {
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
    flag: Bool?;
    text: String?;
}

contract StorageTest {
    d: DeepOptional;

    init() {
        self.d = DeepOptional{
            nestedOpt: InnerOpt{
                value: null,
                flag: true,
                text: "deep"
            }
        };
    }
}