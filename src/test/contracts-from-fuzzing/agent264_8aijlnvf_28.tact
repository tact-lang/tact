struct AllKinds {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract MixAllStruct {
    data: AllKinds;

    init() {
        self.data = AllKinds{
            i:1, b:true, s:"hi", oi:null, ob:null, os:null
        };
    }
}