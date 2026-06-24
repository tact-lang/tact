struct DeepOpt {
    a:Int?;
    b:Bool?;
    c:String?;
}

contract StructInsideOptional {
    f: DeepOpt?;

    init() {
        self.f = DeepOpt{a:null,b:true,c:null};
    }
}
