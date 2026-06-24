struct HasBuilder {
    bld: Builder;
}

contract BuilderInStruct {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{ bld: beginCell() };
    }
}