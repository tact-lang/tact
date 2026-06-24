struct OptSerials {
    x: Int as int8;
    y: Int?;
    z: Int? as uint16;
}

contract MixOptSerial {
    f: OptSerials;

    init() {
        self.f=OptSerials{
            x: 55,
            y: null,
            z: null,
        };
    }
}