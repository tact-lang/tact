struct StrStruct {
    s: String;
    n: Int;
}

contract StringInStruct {
    data: StrStruct;

    init() {
        self.data = StrStruct {
            s: "Test String",
            n: 42
        };
    }
}
