// Contract with nested optional struct inside nested optional struct
struct SubOptional {
    x: Int;
    y: String?;
}

struct MiddleOptional {
    sub: SubOptional?;
}

contract OptionInOption {
    m: MiddleOptional?;

    init() {
        self.m = null;
    }
}