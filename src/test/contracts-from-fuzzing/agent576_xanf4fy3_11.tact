struct BuildWrap {
    b: Builder;
}

contract BuilderField {
    stuff: BuildWrap;

    init() {
        self.stuff = BuildWrap{ b: beginCell() };
    }
}
