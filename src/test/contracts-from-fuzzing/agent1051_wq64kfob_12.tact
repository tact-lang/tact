struct StringsInStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStructContract {
    data: StringsInStruct;

    init() {
        self.data = StringsInStruct{
            s1: "Hello",
            s2: "World",
            s3: "!"
        };
    }
}