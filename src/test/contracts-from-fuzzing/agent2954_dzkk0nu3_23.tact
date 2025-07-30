struct LargeText {
    text1: String;
    text2: String;
    text3: String;
    text4: String;
    text5: String;
}

contract LargeStructStrings {
    s: LargeText;
    init() {
        self.s = LargeText{
            text1:"a", text2:"b", text3:"c", text4:"d", text5:"e"
        };
    }
}
