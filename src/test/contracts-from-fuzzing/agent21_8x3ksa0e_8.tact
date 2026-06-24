contract TestSerialization {
    // Test map with serialized keys and values using fixed-width 8-bit serialization.
    get fun test(): Int {
         let m: map<Int as uint8, Int as uint8> = emptyMap();
         m.set(1, 255);
         return m.get(1)!!;
    }
}
