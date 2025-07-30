// Valid serialization: using fixed-width serialization for keys and values
contract TestMapSerialization {
    // Declare map with keys and values serialized as uint8
    m: map<Int as uint8, Int as uint8> = emptyMap();

    init() {
        // Insert an entry into the map
        self.m.set(10, 20);
    }

    // Getter function for testing
    get fun getValue(k: Int): Int? {
        return self.m.get(k);
    }
}
