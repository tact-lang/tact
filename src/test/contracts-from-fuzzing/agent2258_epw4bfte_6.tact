struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: String?;
}

contract ContractWithLargeStruct {
    field: LargeStruct = LargeStruct{
        a: 1,
        b: true,
        c: "hi",
        d: null,
        e: null,
        f: "bye",
        g: null,
    };
    receive() {
        let _ = self.field.c;
    }
}