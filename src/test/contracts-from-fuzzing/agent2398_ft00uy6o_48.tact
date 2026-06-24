struct BuilderStruct {
    b: Builder;
}

contract TestContract {
    x: BuilderStruct;

    init() {
        self.x = BuilderStruct{ b: beginCell() };
    }
}