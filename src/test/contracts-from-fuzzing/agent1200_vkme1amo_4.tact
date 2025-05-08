struct OptionalStruct {
    val: Int;
    text: String;
}

contract OptInPersistent {
    maybeData: OptionalStruct?;

    init() {
        self.maybeData = OptionalStruct{
            val: 99,
            text: "opt",
        };
    }
}