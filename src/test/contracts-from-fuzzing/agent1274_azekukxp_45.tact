struct BuilderHolder {
    b: Builder;
}

contract BuilderPersistentField {
    val: BuilderHolder;

    init() {
        self.val = BuilderHolder {
            b: beginCell()
        };
    }
}