struct StringStruct {
    s1: String;
    s2: String;
}

struct Wrap {
    w: StringStruct;
}

contract DeepString {
    data: Wrap;

    init() {
        self.data = Wrap{
            w: StringStruct{ s1: "foo", s2: "bar" }
        };
    }
}