struct InnerOpt {
    nested: Int?;
}

contract TopLevelNestedOptional {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{nested: null};
    }
}