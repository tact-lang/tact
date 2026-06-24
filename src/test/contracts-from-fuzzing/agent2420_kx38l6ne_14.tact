struct NestedStrings {
    s1: String;
    s2: String?;
}

struct Msg {
    ns: NestedStrings;
    s3: String;
}

contract StringsInStructs {
    m: Msg;

    init() {
        self.m = Msg{
            ns: NestedStrings{
                s1: "hello",
                s2: null,
            },
            s3: "world",
        };
    }
}