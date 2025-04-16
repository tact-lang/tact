struct DeepSerialization {
    x: Int as uint8;
    y: Bool;
    z: Int as int64;
}

contract DeepSerContract {
    f: DeepSerialization;
    
    init() {
        self.f = DeepSerialization{
            x: 255,
            y: true,
            z: -123456789,
        };
    }
}