struct OptStruct {
    foo: Int;
}

contract OptStructPersisted {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}