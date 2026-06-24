struct InnerA {
    inA: Int;
    inB: Bool;
}

struct InnerB {
    str: String;
    addr: Address;
}

struct Combo {
    first: InnerA;
    second: InnerB;
    third: Bool?;
    fourth: Int?;
}

contract TestCombo {
    val: Combo;

    init() {
        self.val = Combo{
            first: InnerA {inA: 1, inB: false},
            second: InnerB {str: "xyz", addr: myAddress()},
            third: null,
            fourth: null
        };
    }
}