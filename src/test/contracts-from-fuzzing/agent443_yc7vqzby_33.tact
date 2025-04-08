struct AggressiveMany {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f:String?;
    g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
}

contract MixAggressive {
    z: AggressiveMany;

    init() {
        self.z = AggressiveMany{
            a:1, b:false, c:"x", d:null, e:true, f:null,
            g:2, h:true, i:"y", j:null, k:false, l:"z"
        };
    }
}