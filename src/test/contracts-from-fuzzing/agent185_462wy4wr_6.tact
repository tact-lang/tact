struct SerializationMix {
    intVal: Int as uint32;
    flag: Bool;
    intSigned: Int as int16;
}

contract MixedSerialization {
    payload: SerializationMix;

    init() {
        self.payload = SerializationMix{
            intVal: 11,
            flag: false,
            intSigned: -12
        };
    }
}