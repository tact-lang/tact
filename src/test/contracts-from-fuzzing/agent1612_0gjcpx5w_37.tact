// test: multiple levels, nested optionals, and default values
struct InnerOpt {
    i: Int?;
    b: Bool?;
}

struct MiddleOpt {
    inside: InnerOpt?;
}

contract MultiLevelOptionals {
    field: MiddleOpt;

    init() {
        self.field = MiddleOpt{
            inside: null
        };
    }
}
