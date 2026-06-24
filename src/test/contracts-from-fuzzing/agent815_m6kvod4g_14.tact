struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: SubStruct;
}

struct SubStruct {
    f: Int;
    g: Bool?;
    h: String;
}

contract LargeNestedTest {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 1,
            b: false,
            c: "hi",
            d: myAddress(),
            e: SubStruct{
                f: 123,
                g: null,
                h: "sub"
            }
        };
    }
}