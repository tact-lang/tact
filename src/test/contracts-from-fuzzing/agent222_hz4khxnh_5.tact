struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalPersists {
    s: OptionalsInStruct = OptionalsInStruct{a: null, b: null, c: null};

    receive() {
        self.s = OptionalsInStruct{a: 5, b: true, c: "hi"};
    }
}