struct MixSerialize {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;
    s: String;
}

contract MixedSerStruct {
    m: MixSerialize;

    init() {
        self.m = MixSerialize{
            x:1, y:2, z:3, s:"hello"
        };
    }
}