struct WrapString {
    text: String;
}

contract ComposeWrap {
    w: WrapString;

    init() {
        self.w = WrapString{
            text: "Wrapped"
        };
    }
}