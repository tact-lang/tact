struct Lvl3 {
    x: Int?;
}

struct Lvl2 {
    nested: Lvl3;
}

struct Lvl1 {
    inside: Lvl2;
}

contract ContractDeepStruct {
    data: Lvl1;

    init() {
        self.data = Lvl1{
            inside: Lvl2{
                nested: Lvl3{
                    x: null
                }
            }
        };
    }
}