struct StringStruct {
    text: String;
    desc: String?;
}

contract TestContract {
    s: StringStruct;

    init() {
        self.s = StringStruct{
            text: "lorem",
            desc: null
        };
    }
}