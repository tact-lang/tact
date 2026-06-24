struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract ComboTest {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1,b:null,c:true,d:false,e:"hi",f:null,g:myAddress(),h:null,i:emptyCell(),j:null
        };
    }
}