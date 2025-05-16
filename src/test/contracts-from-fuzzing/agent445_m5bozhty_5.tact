struct Big1 { f1: Int; f2: Bool; f3: Address; f4: String; f5: Cell; }
struct Big2 { g1: Int?; g2: Bool?; g3: Address?; g4: String?; g5: Cell?; }

struct Combo {
    s1: Big1;
    s2: Big2;
}

contract Composite {
    data: Combo;
    init() {
        self.data = Combo{
            s1: Big1{f1:1,f2:true,f3:myAddress(),f4:"x",f5:emptyCell()},
            s2: Big2{g1:null,g2:null,g3:null,g4:null,g5:null}
        };
    }
}