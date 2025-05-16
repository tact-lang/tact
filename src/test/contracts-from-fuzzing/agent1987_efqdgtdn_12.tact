struct SerializationAnnotated {
    one: Int as uint8;
    two: Int as int16;
    three: Int as int257;
}

contract SerializedContract {
    s: SerializationAnnotated;
    init() {
        self.s = SerializationAnnotated{
            one: 255,
            two: -12345,
            three: 999999999
        };
    }
}