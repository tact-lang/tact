struct UseOptDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract OptDefaultsStruct {
    data: UseOptDefault;

    init() {
        self.data = UseOptDefault{};
    }
}