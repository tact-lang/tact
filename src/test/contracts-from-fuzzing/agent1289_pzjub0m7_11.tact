struct OptStruct {
    num: Int;
    flag: Bool;
}

contract OptionalOfStructField {
    info: OptStruct?;

    init() {
        self.info = null;
    }
}