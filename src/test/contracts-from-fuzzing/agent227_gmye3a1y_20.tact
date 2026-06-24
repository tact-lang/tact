struct BuilderStruct {
    builder: Builder;
}

contract TestContract {
    data: BuilderStruct;

    init() {
        self.data = BuilderStruct{ builder: beginCell() };
    }
}