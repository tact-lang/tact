// contract with deeply nested optional sequences of length 7
struct D7 {v:Int?;}
struct D6 {d7:D7?;}
struct D5 {d6:D6?;}
struct D4 {d5:D5?;}
struct D3 {d4:D4?;}
struct D2 {d3:D3?;}
struct D1 {d2:D2?;}

contract SevenDeep {
    x:D1;
    init(){ self.x = D1{d2:null}; }
}
