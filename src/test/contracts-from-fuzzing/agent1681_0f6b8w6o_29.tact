// Mixture of nested structs, optionals and default values
struct DeepOpt {
    a:Int?;
    b:Bool;
    c:InnerDef;
}

struct InnerDef {
    x:Int=7;
    y:Bool?;
}

contract DeepMix {
    data: DeepOpt;
    init() {
        self.data = DeepOpt{
            a:null,
            b:true,
            c:InnerDef{ y:null }
        };
    }
    receive() {
        self.data = self.data;
    }
}