struct TextValues {
    str1: String;
    str2: String;
    flag: Bool;
}

contract StringStorage {
    val: TextValues;

    init() {
        self.val = TextValues{
            str1: "hello",
            str2: "world",
            flag: true
        };
    }
}