struct NumSerialized {
    small: Int as int8;
    medium: Int as int64;
    big: Int as int256;
}

contract StructSerialized {
    f: NumSerialized;
    
    init() {
        self.f = NumSerialized{
            small: -5,
            medium: 1234567,
            big: 999999999999
        };
    }
}