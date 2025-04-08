struct WithLongString {
    text: String;
    flag: Bool;
}

contract LongStringStored {
    data: WithLongString;

    init() {
        self.data = WithLongString {
            text: "This is a long string to test unicode utf8 😃🚀🌟 with many characters & symbols! 1234567890" ,
            flag: true,
        };
    }
}
