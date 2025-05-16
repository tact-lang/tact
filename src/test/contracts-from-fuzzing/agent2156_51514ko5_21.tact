struct Inside1 {
    x: Int;
    y: String;
}

struct Inside2 {
    a: Int;
    b: Bool;
}

struct Combo {
    s1: Inside1;
    s2: Inside2;
}

contract ComboFields {
    combo: Combo;
    init() {
        self.combo = Combo{
            s1: Inside1{x:1,y:"x"},
            s2: Inside2{a:2,b:true}
        };
    }
}