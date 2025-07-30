struct Texts {
    t1: String;
    t2: String?;
    t3: String;
}

contract StringFieldsContract {
    texts: Texts;

    init() {
        self.texts = Texts{
            t1: "hello",
            t2: null,
            t3: "world"
        };
    }
}