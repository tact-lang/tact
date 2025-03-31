contract TestMapSerialization {
    // Valid usage of map with serialized keys and values
    get fun test() : Int {
        // Allowed: map with key and value serialized as uint8
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        m.set(42, 100);
        return m.get(42)!!;
    }
}
