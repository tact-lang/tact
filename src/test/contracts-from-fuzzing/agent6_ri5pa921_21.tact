contract MapAddressTest {
    // Test map with Address as key type
    get fun test() : Int {
         let m: map<Address, Int> = emptyMap();
         m.set(myAddress(), 42);
         return m.get(myAddress())!!;
    }
}

contract MapIterationDiscard {
    // Test iterating over map using discard for keys
    get fun test() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         let s = 0;
         foreach (_, value in m) {
             s = s + value;
         }
         return s; // expected 30
    }
}
