struct Boo {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

struct Far {
    boo: Boo;
    flg: Bool?;
}

contract D {
    outer: Far;
    init() {
        self.outer = Far{boo:Boo{i:1,b:true,s:"x",o:null}, flg:false};
    }
}