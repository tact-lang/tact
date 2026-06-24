struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: String?;
}

contract BigStructTest {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "hi",
            d: 2,
            e: null,
            f: "",
            g: InnerStruct{
                x: 99,
                y: null
            }
        };
    }
}