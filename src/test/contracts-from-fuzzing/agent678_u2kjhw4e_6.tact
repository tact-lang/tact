struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address;
}

contract TestContract {
    ws: WideStruct;
    init() {
        self.ws = WideStruct{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: null,
            f: false,
            g: null,
            h: myAddress()
        };
    }
}