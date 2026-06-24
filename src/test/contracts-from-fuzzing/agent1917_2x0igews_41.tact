struct MixOptSerialization {
    a: Int? as uint8;
    b: Bool?;
    c: String?;
}

contract MixOptSer {
    s: MixOptSerialization;

    init() {
        self.s = MixOptSerialization{a:null,b:null,c:null};
    }
}