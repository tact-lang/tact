struct Deep {
    s: Sub;
    t: Sub;
}

struct Sub {
    sp: Sub2;
    sq: Sub2;
}

struct Sub2 {
    a: Int;
    b: Bool?;
    c: String;
}

contract DeepTree {
    data: Deep;

    init() {
        self.data = Deep{
            s: Sub{ sp: Sub2{a:1,b:true,c:"A"}, sq: Sub2{a:2,b:null,c:"B"} },
            t: Sub{ sp: Sub2{a:3,b:false,c:"C"}, sq: Sub2{a:4,b:true,c:"D"} }
        };
    }
}
