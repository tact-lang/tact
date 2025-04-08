struct StringNest {
    text1: String;
    text2: String;
}

struct StringOuter {
    s1: String;
    s2: StringNest;
    s3: String;
}

contract NestedStringsTest {
    strings: StringOuter;

    init() {
        self.strings = StringOuter{
            s1: "hello",
            s2: StringNest{
                text1: "foo",
                text2: "bar"
            },
            s3: "world"
        };
    }

    receive() {}
}