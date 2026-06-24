struct Num {
    v: Int;
}

struct BoolWrap {
    v: Bool;
}

struct Str {
    v: String;
}

struct CellWrap {
    v: Cell;
}

struct Addr {
    v: Address;
}

struct Opt {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    addrOpt: Address?;
}

struct Combo {
    n: Num;
    b: BoolWrap;
    s: Str;
    c: CellWrap;
    a: Addr;
    o: Opt;
}

contract Test {
    x: Combo;
    init() {
      self.x = Combo{
        n: Num{v:1},
        b: BoolWrap{v:false},
        s: Str{v:""},
        c: CellWrap{v:emptyCell()},
        a: Addr{v:myAddress()},
        o: Opt{intOpt:null,boolOpt:true,strOpt:null,cellOpt:null,addrOpt:null}
      };
    }
}