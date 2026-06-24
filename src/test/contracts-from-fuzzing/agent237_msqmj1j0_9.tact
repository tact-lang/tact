struct LongStringContainer {
    text: String;
}

contract ManyStrings {
    s1: LongStringContainer;
    s2: LongStringContainer;
    s3: LongStringContainer;
    init() {
        self.s1 = LongStringContainer{text: "a"};
        self.s2 = LongStringContainer{text: "b"};
        self.s3 = LongStringContainer{text: "c"};
    }
}