struct Sub1 { a:Int; b:Bool; }
struct Sub2 { x:String; y:Bool; }

struct Big {
    s1:Sub1;
    s2:Sub2;
    optS1:Sub1?;
    optS2:Sub2?;
    s1again:Sub1;
    txt:String;
    flag:Bool;
}

contract MixNestedOpt {
    store: Big;

    init() {
        self.store = Big{
            s1:Sub1{a:1,b:true},
            s2:Sub2{x:"hi",y:false},
            optS1:null,
            optS2:null,
            s1again:Sub1{a:2,b:false},
            txt:"wow",
            flag:true,
        };
    }
}
