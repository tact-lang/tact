struct ManyTypes {
    ai: Int;
    bl: Bool;
    st: String;
    oa: Int?;
    ob: Bool?;
    os: String?;
}

contract MixedTypes {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            ai:42, bl:true, st:"string",
            oa:null, ob:false, os:null
        };
    }
}