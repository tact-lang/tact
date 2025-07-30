struct OptionStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionStructOpt {
    data: OptionStruct?;

    init() {
        self.data = null;
    }
}