contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Set a key-value pair
         self.m.set(42, 100);
         
         // Test .get() for an existing key
         let value: Int = self.m.get(42)!!;
         dump(value);
         
         // Test .get() for a non-existent key
         let missing: Int? = self.m.get(1);
         if (missing == null) {
             dump(0);
         } else {
             dump(missing!!);
         }
    }
}
