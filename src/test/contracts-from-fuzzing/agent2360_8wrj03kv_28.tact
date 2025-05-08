// Large struct nesting, test serialization correctness
struct Horiz1 {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct Horiz2 {
    h1: Horiz1;
    h2: Horiz1;
    h3: Horiz1;
}

contract ManyStructs {
    s: Horiz2;
    init() {
        self.s = Horiz2{
            h1: Horiz1{f1:1,f2:true,f3:"x"},
            h2: Horiz1{f1:2,f2:false,f3:"y"},
            h3: Horiz1{f1:3,f2:true,f3:"z"}
        };
    }
}