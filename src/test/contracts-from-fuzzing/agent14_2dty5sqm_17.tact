struct SerializedResult {
    k1: Int?;
    k2: Int?;
}

contract TestSerializedMapOK {
    // A map with serialized key and value formats: both as uint8
    m: map<Int as uint8, Int as uint8> = emptyMap();

    init() {
        // Insert some key-value pairs; keys/values must be in 0..255
        self.m.set(10, 20);
        self.m.set(200, 250);
    }

    get fun test(): SerializedResult {
        return SerializedResult{
            k1: self.m.get(10),
            k2: self.m.get(200)
        };
    }
}
