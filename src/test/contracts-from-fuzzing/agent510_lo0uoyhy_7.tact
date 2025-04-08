struct Nested {
    d: Int?;
    flag: Bool;
}

struct BigStruct {
    a: Int;
    b: Bool?;
    c: String?;
    n: Nested?;
}

contract CompositeOptionals {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 10,
            b: null,
            c: "hi",
            n: Nested{
                d: null,
                flag: true,
            },
        };
    }
}