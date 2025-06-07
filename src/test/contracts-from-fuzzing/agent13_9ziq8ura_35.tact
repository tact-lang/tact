struct ComplexDeep {
    a:Int;
    b:Bool;
    c:Int?;
    d:Bool?;
    e:Int;
    f:Bool;
    g:Int?;
    h:Bool?;
}

contract ComplexDeepNested {
    s: ComplexDeep;

    init() {
        self.s = ComplexDeep{
            a:1,b:true,c:null,d:null,e:2,f:false,g:null,h:null
        };
    }
}