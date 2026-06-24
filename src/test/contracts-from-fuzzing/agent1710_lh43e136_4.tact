struct OptionStruct {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract PersistOptional {
    opts: OptionStruct;

    init() {
        self.opts = OptionStruct{ foo: null, bar: true, text: null };
    }
}