contract TestSerializedMap {
    // Testing a map with serialized integer keys and values
    get fun test(): Int {
         let m: map<Int as uint8, Int as uint8> = emptyMap();
         m.set(1, 100);
         return m.get(1)!!;
    }
}
