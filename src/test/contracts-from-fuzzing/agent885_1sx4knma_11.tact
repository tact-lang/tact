struct DeepOptionalStruct {
    so1: Int?;
    so2: String?;
    so3: Bool?;
}

struct MidStruct {
    dos: DeepOptionalStruct;
    extra: Int;
}

contract TestContract {
    top: MidStruct;

    init() {
        self.top = MidStruct{
            dos: DeepOptionalStruct{
                so1: null,
                so2: "midway",
                so3: false,
            },
            extra: 77,
        };
    }
}