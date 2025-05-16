struct D {
    a:Int; b:Bool; c:String; d:Int?; e:Bool?; f:String?;
}

contract TestDeeper {
    x:D;
    y:D;
    z:D;

    init() {
        self.x = D{ a:1, b:true, c:"hi", d:null, e:true, f:null };
        self.y = D{ a:2, b:false, c:"bye", d:3, e:null, f:"!" };
        self.z = D{ a:4, b:true, c:"yo", d:null, e:false, f:null };
    }
}