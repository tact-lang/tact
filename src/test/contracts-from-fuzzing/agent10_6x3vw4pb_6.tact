contract TestMapSerialize {
    get fun test() : Int {
       let m: map<Int as uint8, Int as uint8> = emptyMap();
       m.set(5, 10);
       return m.get(5)!!;
    }
}
