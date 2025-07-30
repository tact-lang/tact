struct S1 {
    a: Int;
    b: Bool?;
    c: String;
}

struct S2 {
    s1: S1?;
    d: Address;
}

contract Complicated {
    big: S2;
    init() {
        self.big = S2{
            s1: S1{ a: 1, b: null, c: "hi" },
            d: myAddress()
        };
    }
}