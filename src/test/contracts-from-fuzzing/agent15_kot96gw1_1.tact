contract TestMap1 {
    // Test valid map<Int, Int> operations: set, replace, get
    get fun test(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.replace(1, 20);
         return m.get(1)!!;
    }
}

// This contract should compile successfully and return 20 when test() is invoked.