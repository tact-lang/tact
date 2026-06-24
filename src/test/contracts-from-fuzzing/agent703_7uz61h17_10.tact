struct StrStruct {
    s: String;
}

contract StringTest {
    val: StrStruct;

    init() {
        self.val = StrStruct{
            s: "A very long string with emojis 🚀🔥 and special chars #$%&" 
        };
    }
}