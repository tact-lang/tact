struct BuilderHolder {
    b: Builder;
}

contract BuilderInPersist {
    data: BuilderHolder;

    init() {
        self.data = BuilderHolder{ b: beginCell() };
    }
}