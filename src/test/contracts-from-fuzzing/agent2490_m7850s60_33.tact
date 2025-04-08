struct SNest {
    s1: Int;
    s2: Int;
}

struct SNest2 {
    s: SNest;
    flag: Bool;
}

struct SNest3 {
    inner: SNest2;
    text: String;
}

contract MultiLevelStruct {
    field: SNest3;

    init() {
        self.field = SNest3{
            inner: SNest2{
                s: SNest{s1: 1, s2:2},
                flag: true,
            },
            text: "text",
        };
    }
}