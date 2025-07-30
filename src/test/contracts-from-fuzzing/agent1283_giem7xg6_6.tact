struct Serialized {
    small: Int as uint8;
    large: Int as int257;
    tiny: Int as uint1;
    flag: Bool;
}

contract SerializedStruct {
    x: Serialized;

    init() {
        self.x = Serialized{
            small: 255,
            large: 123456789,
            tiny: 1,
            flag: true,
        };
    }
}