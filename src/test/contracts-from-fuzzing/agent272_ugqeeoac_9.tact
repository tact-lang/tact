struct OptInStructDefault {
    foo: Int? = null;
    bar: Bool? = null;
}

contract OptDefaultsPersist {
    sfield: OptInStructDefault;

    init() {
        self.sfield = OptInStructDefault{};
    }
}