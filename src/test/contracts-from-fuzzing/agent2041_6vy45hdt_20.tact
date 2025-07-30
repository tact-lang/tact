struct Combo {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    s2: String?;
}

struct Container {
    c1: Combo;
    c2: Combo;
    flag: Bool;
}

contract ManyCombos {
    d: Container;
    init() {
        self.d = Container{
            c1: Combo{ i:1,b:true,s:"a",o:null,s2:null },
            c2: Combo{ i:2,b:false,s:"b",o:5,s2:"y" },
            flag: true
        };
    }
}