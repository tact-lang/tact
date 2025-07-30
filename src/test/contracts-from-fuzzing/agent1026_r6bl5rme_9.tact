struct HasString {
    s: String;
}

contract StringStruct {
    data: HasString;

    init() {
        self.data = HasString{
            s: "abc"
        };
    }
}