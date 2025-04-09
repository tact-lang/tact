struct OptionStruct {
    maybe: Int?;
    txt: String;
}

contract OptionalFieldStructContract {
    data: OptionStruct = OptionStruct{ maybe: null, txt: "hello" };

    init() {
        self.data = OptionStruct{ maybe: 5, txt: "world" };
    }
}