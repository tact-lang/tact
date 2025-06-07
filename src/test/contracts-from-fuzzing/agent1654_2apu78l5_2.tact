struct OptionalNesting {
    innermost: Int?;
}

struct TopLevel {
    middle: OptionalNesting?;
}

contract TestContract {
    data: TopLevel;
    init() {
        self.data = TopLevel{middle: OptionalNesting{innermost: null}};
    }
}