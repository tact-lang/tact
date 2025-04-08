struct ManyFields {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "e";
    f: String?;
    g: Int = 7;
    h: Int?;
    i: Bool = true;
    j: String = "j";
    k: Bool?;
    l: Int = 12;
    m: String?;
    n: Int = 14;
    o: Bool = false;
}

contract TestContract {
    data: ManyFields = ManyFields{};

    init() {
        self.data = ManyFields{
            a: 10,
            b: 20,
            c: true,
            d: false,
            e: "E",
            f: "F",
            g: 70,
            h: 80,
            i: false,
            j: "J",
            k: true,
            l: 120,
            m: "M",
            n: 140,
            o: true
        };
    }
}