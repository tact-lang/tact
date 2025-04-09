struct MixedSerialized {
    a: Int as uint8;
    b: Int;
    c: Bool;
    d: String;
    e: Int as int32;
    f: Bool?;
    g: Int?;
}

contract TestContract {
    d: MixedSerialized;

    init() {
        self.d = MixedSerialized{
            a:1, b:2, c:true, d:"hi", e:-33, f:null, g:99
        };
    }
}