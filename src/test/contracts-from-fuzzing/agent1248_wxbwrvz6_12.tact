struct SOptDef {
    foo: Int = 7;
    bar: Bool? = null;
}

contract OptDefaultField {
    data: SOptDef? = null;

    init() {
        self.data = null;
    }
}
