struct S {
    a:Int;
    b:Int?;
    c:String;
    d:String?;
    e:Bool;
    f:Bool?;
}

contract OptDeep {
    s:S;
    init(){
        self.s=S{a:1,b:null,c:"hi",d:null,e:true,f:null};
    }
}