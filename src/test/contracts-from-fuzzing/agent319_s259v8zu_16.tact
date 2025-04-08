struct StringStruct {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TestContract {
    textData: StringStruct;

    init() {
        self.textData = StringStruct{
            s1:"hi",
            s2:null,
            s3:"hello",
            s4:null
        };
    }
}