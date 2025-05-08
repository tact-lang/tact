struct DeepOptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct DeeperOptionalStruct {
    a: DeepOptionalStruct?;
    b: Int?;
}

contract DeepOptionalTest {
    data: DeeperOptionalStruct?;

    init() {
        self.data = DeeperOptionalStruct{
            a: null,
            b: 10,
        };
    }
}
