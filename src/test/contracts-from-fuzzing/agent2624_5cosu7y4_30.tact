struct BigFlat {
    a: Int;
    b: Bool; 
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract BigFlatStorage {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            a: 1,
            b: true,
            c: "x",
            d: 2,
            e: false,
            f: null,
            g: 3,
            h: true,
            i: "z"
        };
    }
}
