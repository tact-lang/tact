struct InnerOpt {
    value: Int?;
}

contract NestedOptCorrect {
    stuff: InnerOpt? = null;

    init() {
        self.stuff = InnerOpt{ value: 99 };
    }
}