struct InnerLevel {
    id: Int;
    flag: Bool;
    info: String?;
}

struct MiddleLevel {
    first: InnerLevel;
    second: InnerLevel;
}

contract TestContract {
    nestedStruct: MiddleLevel;

    init() {
        self.nestedStruct = MiddleLevel{
            first: InnerLevel{ id: 1, flag: true, info: null },
            second: InnerLevel{ id: 2, flag: false, info: "info" },
        };
    }
}