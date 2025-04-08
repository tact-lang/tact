struct BigWide {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    c1: Cell;
    c2: Cell;
    c3: Cell;
    c4: Cell;
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract ExtraWide {
    big: BigWide;

    init() {
        self.big = BigWide{
            a1: 1, a2: 2, a3: 3, a4: 4, a5: 5,
            b1: true, b2: false, b3: true, b4: false,
            s1: "1", s2: "2", s3: "3", s4: "4", s5: "5",
            c1: emptyCell(), c2: emptyCell(), c3: emptyCell(), c4: emptyCell(),
            addr1: myAddress(), addr2: myAddress(), addr3: myAddress()
        };
    }
}