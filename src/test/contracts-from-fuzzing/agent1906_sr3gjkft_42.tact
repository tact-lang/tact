// Nine nested optional wrappers
struct D9 {v:Int?;}
struct D8 {d9:D9?;}
struct D7 {d8:D8?;}
struct D6 {d7:D7?;}
struct D5 {d6:D6?;}
struct D4 {d5:D5?;}
struct D3 {d4:D4?;}
struct D2 {d3:D3?;}
struct D1 {d2:D2?;}

contract NineDeep {
    x:D1;
    init(){ self.x = D1{d2:null}; }
}
