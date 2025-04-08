// Large struct with many fields of varying types (excluding maps)
struct LargeStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Int?;
    f: String;
    g: Bool?;
    h: Address?;
    i: Int;
    j: String;
}

contract TestContract {
    ls: LargeStruct;
    init() {
        self.ls = LargeStruct {
            a: 1,
            b: "str1",
            c: true,
            d: myAddress(),
            e: null,
            f: "str2",
            g: false,
            h: null,
            i: 42,
            j: "str3"
        };
    }
}