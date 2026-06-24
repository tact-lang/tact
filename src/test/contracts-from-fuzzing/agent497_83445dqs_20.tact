struct JustOptionalStr {
    s: String?;
}

contract OptionalInStruct {
    data: JustOptionalStr;

    init() {
        self.data = JustOptionalStr{
            s: "hello"
        };
    }
}