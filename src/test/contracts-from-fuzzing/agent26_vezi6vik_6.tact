contract SerializedMap {
    // A map with both keys and values serialized as 8-bit unsigned integers
    m: map<Int as uint8, Int as uint8> = emptyMap();

    init() {
        self.m.set(10, 255);
    }

    get fun getValue(key: Int) : Int? {
        return self.m.get(key);
    }
}
