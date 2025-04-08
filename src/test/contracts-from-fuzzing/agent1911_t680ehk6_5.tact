struct StringsNested {
    s1: String;
    child: Strings2;
}

struct Strings2 {
    s2: String;
    s3: String;
}

contract StringNestTest {
    all: StringsNested;

    init() {
        self.all = StringsNested{
            s1: "a",
            child: Strings2{
                s2: "b",
                s3: "c"
            }
        };
    }
}