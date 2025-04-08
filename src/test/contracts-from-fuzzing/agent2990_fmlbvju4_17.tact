struct A { f1: Int; f2: Int; }
struct B { f1: String; f2: String; }

struct Combo {
    a: A; b: B;
    a2: A; b2: B;
}

contract ComboContract {
    data: Combo;
    init() {
        self.data = Combo{
            a: A{f1:1,f2:2}, b: B{f1:"x",f2:"y"},
            a2: A{f1:3,f2:4}, b2: B{f1:"z",f2:"w"}
        };
    }
}