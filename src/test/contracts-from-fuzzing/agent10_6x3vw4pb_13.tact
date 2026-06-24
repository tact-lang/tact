contract TestMapSerializeOverflow {
    get fun test() : Int {
       // Int as uint8: allowed range is 0-255. Using 300 may cause truncation or error.
       let m: map<Int as uint8, Int as uint8> = emptyMap();
       m.set(300, 300);
       // If the serialization truncates, then key becomes 300 mod 256 = 44, and value becomes 44.
       // So lookup with key 44 should return 44.
       return m.get(44)!!;
    }
}
