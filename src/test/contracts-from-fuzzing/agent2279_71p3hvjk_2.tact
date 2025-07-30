struct InnerMost {
    flag: Bool;
    count: Int;
}

struct MiddleOptional {
    midFlag: Bool;
    innerOpt: InnerMost?;
}

struct TopLevel {
    text: String;
    middle: MiddleOptional;
}

contract DeepNestedOptional {
    content: TopLevel?;

    init() {
        self.content = null;
    }
}