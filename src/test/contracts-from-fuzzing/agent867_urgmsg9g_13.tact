message(1) SM1 {}
message(2) SM2 { f: Int; }
message(3) SM3 { g: String; h: Bool?; }

struct Combo {
    one: SM1;
    two: SM2;
    three: SM3;
}

contract StructWithMessages {
    s: Combo;
    init() {
        self.s = Combo{
            one: SM1{},
            two: SM2{ f: 123 },
            three: SM3{ g: "hi", h: true }
        };
    }
}