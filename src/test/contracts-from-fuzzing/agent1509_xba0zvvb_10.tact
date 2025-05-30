struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestWide {
    val: Wide;
    init() {
        self.val = Wide {
            a: 1,
            b: false,
            c: "c",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
    receive() {
        let _ = self.val.d;
    }
}