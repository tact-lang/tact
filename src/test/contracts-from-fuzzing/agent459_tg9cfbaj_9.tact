struct OptStruct {
    val: Int;
}

contract OptionalStructStorage {
    maybe: OptStruct? = null;

    init() {
        self.maybe = OptStruct{ val: 123 };
    }
}