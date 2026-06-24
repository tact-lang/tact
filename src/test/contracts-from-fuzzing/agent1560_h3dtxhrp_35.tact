struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String?;
    h: Address;
}

contract TestContract {
    val: BigStruct;
    init() {
        self.val = BigStruct{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: myAddress()
        };
    }
}