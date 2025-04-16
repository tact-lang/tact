struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
}

struct OuterStruct {
    inner: InnerStruct;
    flag: Bool;
    note: String;
    owner: Address;
    maybe: Int?;
}

contract NestedStructFields {
    info: OuterStruct;

    init() {
        self.info = OuterStruct{
            inner: InnerStruct{
                a: 123,
                b: true,
                c: "hi",
                d: myAddress(),
                e: false
            },
            flag: false,
            note: "test",
            owner: myAddress(),
            maybe: null
        };
    }
}
