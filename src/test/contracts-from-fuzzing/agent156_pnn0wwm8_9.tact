struct StrEmbed {
    str1: String;
    str2: String?
}

contract StringFieldsTest {
    data: StrEmbed;

    init() {
        self.data = StrEmbed{
            str1: "Hello",
            str2: null
        };
    }
}
