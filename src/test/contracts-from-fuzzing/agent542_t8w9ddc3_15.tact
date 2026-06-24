struct BigFlat {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "X";
    s2: String = "Y";
    s3: String = "Z";
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optAddr: Address?;
    flag: Bool = true;
    label: String = "Lbl";
}

contract FlatStructStorage {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            i1: 10, i2: 20, i3: 30,
            b1: false, b2: true,
            s1: "a", s2: "b", s3: "c",
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            optI: null, optB: null, optS: null, optAddr: null,
            flag: false,
            label: "new"
        };
    }
}