struct LargeStringStruct {
    message1: String;
    message2: String;
    message3: String;
    message4: String;
    message5: String;
}

contract LargeStrings {
    texts: LargeStringStruct;

    init() {
        self.texts = LargeStringStruct{
            message1:"a",
            message2:"b",
            message3:"c",
            message4:"d",
            message5:"e"
        };
    }
}