struct Inner {
    i: Int;
    b: Bool;
    s: String?;
}

contract ManyInnerRefs {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;

    init() {
        self.a = Inner{i:1,b:true,s:null};
        self.b = Inner{i:2,b:false,s:"B"};
        self.c = Inner{i:3,b:true,s:null};
        self.d = Inner{i:4,b:false,s:"D"};
    }
}
