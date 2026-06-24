struct S {
    a:Int;
    b:Bool;
    c:String;
    d:Int?;
    e:Bool?;
    f:String?;
}

contract TestContract {
    s:S;

    init() {
        self.s = S{
            a:1,b:true,c:"z",d:null,e:false,f:null
        };
    }
}