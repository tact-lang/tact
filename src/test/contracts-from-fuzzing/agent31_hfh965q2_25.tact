struct RepeatedFields {
    a: Int;
    b: Int;
    flag1: Bool;
    flag2: Bool;
    s1: String;
    s2: String;
    opt: Int?;
}

contract Test {
    d1: RepeatedFields;
    d2: RepeatedFields;

    init() {
        self.d1 = RepeatedFields{a:1,b:2,flag1:true,flag2:false,s1:"x",s2:"y",opt:null};
        self.d2 = RepeatedFields{a:3,b:4,flag1:false,flag2:true,s1:"m",s2:"n",opt:null};
    }
}