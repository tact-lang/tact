struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int as uint8;
    f: String?;
    g: Address;
    h: Bool;
    i: Int as uint32;
    j: String;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: 7,
            f: null,
            g: myAddress(),
            h: false,
            i: 777,
            j: "done",
        };
    }
}