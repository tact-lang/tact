struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
}

contract TestContract {
    ws: WideStruct;

    init() {
        self.ws = WideStruct{
            a: 1,
            b: true,
            c: "c",
            d: sender(),
            e: 2,
            f: false,
            g: "g",
            h: sender(),
            i: 3,
            j: true,
            k: "k",
            l: sender(),
        };
    }
}
