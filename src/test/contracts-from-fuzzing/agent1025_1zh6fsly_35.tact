struct EmbedOpt {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

contract MixWithOpt {
    a:Int;
    emb: EmbedOpt;
    b:String;

    init() {
        self.a=1;
        self.emb=EmbedOpt{v1:null,v2:null,v3:null};
        self.b="test";
    }
}
