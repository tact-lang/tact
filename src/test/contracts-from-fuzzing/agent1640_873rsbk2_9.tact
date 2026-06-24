struct OptStruct {
    name: String? = null;
    val: Int = 1;
}

contract OptStructPersists {
    info: OptStruct;

    init() {
        self.info = OptStruct{val: 5};
    }
}