struct MixOptNonOpt {
    x: Int;
    y: Bool?;
    z: String;
}

contract MixFields {
    m: MixOptNonOpt = MixOptNonOpt{ x:1, y:null, z:"aaa" };

    init() {
        self.m = MixOptNonOpt{ x:11, y:true, z:"bbb" };
    }
}