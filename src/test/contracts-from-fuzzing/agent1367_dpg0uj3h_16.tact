struct Texts {
    t1: String;
    t2: String;
    t3: String;
}

struct NestedTexts {
    inner: Texts;
}

contract ManyStrings {
    s: NestedTexts;

    init() {
        self.s = NestedTexts{
            inner: Texts{
                t1: "one",
                t2: "two",
                t3: "three",
            },
        };
    }
}