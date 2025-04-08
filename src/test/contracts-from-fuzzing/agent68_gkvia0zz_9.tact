struct Primitives {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract ManyPrimitives {
    pf1: Primitives;
    pf2: Primitives;
    pf3: Primitives;

    init() {
        self.pf1 = Primitives{i:1,b:true,s:"one",o:null};
        self.pf2 = Primitives{i:2,b:false,s:"two",o:5};
        self.pf3 = Primitives{i:3,b:true,s:"three",o:null};
    }
}