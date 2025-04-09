struct MiddleOpt {
    count: Int?;
    label: String;
}

struct TopOpt {
    middle: MiddleOpt?;
}

contract OptionalsInOptionals {
    container: TopOpt?;

    init() {
        self.container = null;
    }
}