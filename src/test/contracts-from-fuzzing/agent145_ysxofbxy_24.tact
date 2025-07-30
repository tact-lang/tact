struct BuilderHolder {
    b: Builder;
    id: Int;
}

contract BuilderInStruct {
    data: BuilderHolder;

    init() {
        self.data = BuilderHolder {
            b: beginCell(),
            id: 7
        };
    }
}