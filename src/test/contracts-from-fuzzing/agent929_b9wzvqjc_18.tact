struct StringsStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiString {
    textBlock: StringsStruct;
    init() {
        self.textBlock = StringsStruct{
            s1:"Hello",
            s2:"World",
            s3:"!"
        };
    }
}