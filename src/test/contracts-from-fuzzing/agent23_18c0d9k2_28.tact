struct SerialMix {
    x: Int as uint8;
    y: Int as int256;
    z: Int as coins;
    w: Int;
}

contract MixSerialization {
    s: SerialMix;

    init() {
        self.s = SerialMix{ x:1,y:-2,z:3,w:4 };
    }
}