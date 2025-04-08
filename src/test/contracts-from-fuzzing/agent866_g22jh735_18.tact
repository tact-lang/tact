struct Fancy {
    x: Int as uint4;
    y: Int? as uint8;
    z: Int as int32;
}

contract PersistStructSerial {
    data: Fancy;

    init() {
        self.data = Fancy{
            x: 7,
            y: null,
            z: -12345
        };
    }
}

contract Dummy {receive(){}}