struct Combo {
    a: Int;
    b: Bool?;
    c: Address;
    d: Cell?;
    e: Slice;
    f: String?;
}

contract ComboContract {
    f0: Int;
    f1: Combo;
    f2: String;
    f3: Bool?;

    init() {
        self.f0 = 1;
        self.f1 = Combo{
            a: 2,
            b: null,
            c: myAddress(),
            d: null,
            e: emptyCell().asSlice(),
            f: null
        };
        self.f2 = "hello";
        self.f3 = null;
    }
}