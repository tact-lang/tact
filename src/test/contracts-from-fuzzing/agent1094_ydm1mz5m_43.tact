struct ContainsString {
    txt: String;
    optTxt: String?;
}

contract StringFields {
    data: ContainsString;
    init() {
        self.data = ContainsString{txt: "hi", optTxt: null};
    }
}