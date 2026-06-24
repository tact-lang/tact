struct WrapString {
    text: String;
}

contract StringInStruct {
    info: WrapString;

    init() {
        self.info = WrapString{ text: "hello world" };
    }
}