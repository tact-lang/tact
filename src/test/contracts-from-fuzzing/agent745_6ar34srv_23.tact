struct Combo {
    a: Int;
    b: Int?;
    c: Int as uint64;
    d: Int?;
    e: String;
    f: String?;
    g: Bool;
    h: Bool?;
    i: Address;
    j: Address?;
    k: Cell;
    l: Cell?;
}

contract ComboStructTest {
    combo: Combo;
    init() {
        self.combo = Combo{
            a:1,b:null,c:2,d:null,e:"e",f:null,g:true,h:null,i:myAddress(),j:null,k:emptyCell(),l:null
        };
    }
}