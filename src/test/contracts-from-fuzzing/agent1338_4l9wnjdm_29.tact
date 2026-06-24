struct Mixes {
    x: Int;
    y: Bool;
    z: String;
    k: Int?;
    p: Bool?;
    q: String?;
}

contract FieldMixes {
    data: Mixes;

    init() {
        self.data = Mixes{
            x:42, y:true, z:"hi", k:null, p:false, q:null
        };
    }
}