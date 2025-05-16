struct DeepOpt {
    x: Int?;
    y: Int?;
}

struct MiddleOpt {
    a: DeepOpt?;
}

contract MultiLevelOptionals {
    field: MiddleOpt?;

    init() {
        self.field = null;
    }
}