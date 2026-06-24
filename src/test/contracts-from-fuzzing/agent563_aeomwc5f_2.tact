struct Data {
    val: Int;
}

contract OptionalStruct {
    info: Data?;

    init() {
        self.info = null;
    }
}