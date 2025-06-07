struct OptionalStruct {
    val: Int;
    desc: String?;
}

contract OptionField {
    info: OptionalStruct;

    init() {
        self.info = OptionalStruct{
            val: 999,
            desc: null,
        };
    }
}