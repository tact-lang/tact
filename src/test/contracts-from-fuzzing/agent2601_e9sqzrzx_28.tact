struct DeepMul {
    a:Int;
    b:Bool;
    c:String;
    d:Int?;
    e:Bool?;
    f:String?;
}

struct TopMul {
    m1: DeepMul;
    m2: DeepMul;
    m3: DeepMul;
}

contract MultiplyNested {
    data: TopMul;
    init() {
        self.data = TopMul{
            m1: DeepMul{a:1,b:true,c:"x",d:null,e:null,f:null},
            m2: DeepMul{a:2,b:false,c:"y",d:3,e:true,f:null},
            m3: DeepMul{a:3,b:true,c:"z",d:null,e:false,f:"hi"}
        };
    }
}