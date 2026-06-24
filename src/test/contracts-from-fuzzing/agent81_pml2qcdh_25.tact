struct S {
    a:Int;
    b:Bool;
    c:String;
    d:Address;
}

contract MultiStruct {
    f1:S;
    f2:S;
    f3:S;

    init() {
        self.f1 = S{a:1,b:true,c:"c1",d:myAddress()};
        self.f2 = S{a:2,b:false,c:"c2",d:myAddress()};
        self.f3 = S{a:3,b:true,c:"c3",d:myAddress()};
    }
}
