struct InnerNested {
    s: String;
    flag: Bool?;
}

struct BigStruct {
    i: Int;
    inn: InnerNested;
    s2: String;
    b: Bool;
}

contract NestedFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            i: 7,
            inn: InnerNested {
                s: "test",
                flag: null,
            },
            s2: "ok",
            b: false,
        };
    }
}