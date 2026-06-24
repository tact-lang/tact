struct Combo {
    a: Int;
    b: String;
    c: Bool?;
    d: Address;
    e: Int?;
    f: Bool;
    g: String?;
}

contract MixedTypes {
    dat: Combo;
    
    init() {
        self.dat = Combo{
            a: 1,
            b: "test",
            c: null,
            d: myAddress(),
            e: null,
            f: true,
            g: null
        };
    }
}