struct StringStruct {
    s: String;
    opt: String?;
    flag: Bool;
}

contract TestContract {
    data: StringStruct;
    init() {
        self.data = StringStruct{
            s: "hello world",
            opt: null,
            flag: true
        };
    }
}