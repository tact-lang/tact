struct NestedStrings {
    str1: String;
    str2: String;
}

struct Outer {
    inner: NestedStrings;
    str3: String;
}

contract StringsInStructs {
    s: Outer;

    init() {
        self.s = Outer{
            inner: NestedStrings{
                str1: "hello",
                str2: "world",
            },
            str3: "!",
        };
    }
}