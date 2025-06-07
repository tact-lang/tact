struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct MiddleOpt {
    innerOpt: InnerOpt;
    msg: String?;
}

contract NestedOptionalsContract {
    persistentData: MiddleOpt;

    init() {
        self.persistentData = MiddleOpt{
            innerOpt: InnerOpt{ x: null, y: true },
            msg: null
        };
    }
}