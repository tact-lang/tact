contract TestMapValid() {
    fun test() {
         // Test valid usage of map: map<Int, Int>
         let m: map<Int, Int> = emptyMap();
         m.set(1, 100);
         dump(m.get(1)!!); // Expects to dump 100
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
