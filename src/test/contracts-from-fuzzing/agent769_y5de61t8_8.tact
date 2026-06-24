struct Booly {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
}

contract Tiny {
    bits: Booly;
    init() {
        self.bits = Booly{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: false
        };
    }
}