struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Bool?;
    f: Int?;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Int?;
}

contract LargeFieldsTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: "test",
            e: null,
            f: null,
            g: "hello",
            h: myAddress(),
            i: 42,
            j: false,
            k: "end",
            l: null,
        };
    }
}