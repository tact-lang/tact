struct StrWrap {
    s: String
}

contract LongStringField {
    str: StrWrap;

    init() {
        self.str = StrWrap{
            s: "This is a very very very very very very very very very very very very very long string!"
        };
    }
}