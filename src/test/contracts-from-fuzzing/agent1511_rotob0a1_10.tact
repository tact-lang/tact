struct StringHeavy {
    title: String;
    body: String;
    footer: String;
    author: String;
}

contract ManyStrings {
    texts: StringHeavy;
    s1: String;
    s2: String;

    init() {
        self.texts = StringHeavy{
            title: "title",
            body: "body",
            footer: "footer",
            author: "author"
        };
        self.s1 = "extra1";
        self.s2 = "extra2";
    }
}
