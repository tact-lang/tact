struct MixedBits {
    x: Int as uint8;
    y: Int;
}

contract MixedSerialization {
    data: MixedBits;
    init() {
        self.data = MixedBits{ x: 10, y: 256 }; 
    }
}