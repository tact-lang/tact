struct Flattened {
    i1:Int; i2:Int?; b1:Bool; b2:Bool?; s1:String; s2:String?; a1:Address; a2:Address?; c1:Cell; c2:Cell?;
}

contract AllTypesFlat {
    f: Flattened;
    init() {
        self.f = Flattened{
            i1:1, i2:null, b1:true, b2:null,
            s1:"ok", s2:null, a1:myAddress(), a2:null,
            c1:emptyCell(), c2:null
        };
    }
}