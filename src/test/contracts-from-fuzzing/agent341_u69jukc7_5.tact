struct StringStruct {
    txt: String;
    optTxt: String?;
}

contract TestContract {
    s: StringStruct;

    init() {
        self.s = StringStruct{
            txt: "hello",
            optTxt: null,
        };
    }
}