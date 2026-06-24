struct NestedTexts {
    text1: String;
    text2: String;
    text3: String;
}
contract StringGrouping {
    s: NestedTexts;

    init() {
        self.s = NestedTexts{
            text1:"one",
            text2:"two",
            text3:"three",
        };
    }
}