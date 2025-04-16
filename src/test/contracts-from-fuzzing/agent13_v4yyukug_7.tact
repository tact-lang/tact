contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Set a key-value pair and then replace it with a new value using replaceGet
         self.m.set(5, 500);
         let oldVal1: Int? = self.m.replaceGet(5, 600); // Expected to return 500
         dump(oldVal1!!);

         // Attempt replaceGet on a non-existent key: should return null
         let oldVal2: Int? = self.m.replaceGet(10, 1000); // Expected null
         if (oldVal2 == null) {
             dump(0);
         } else {
             dump(oldVal2!!);
         }

         // Test deletion by replacing existing key with null
         self.m.set(7, 700);
         let oldVal3: Int? = self.m.replaceGet(7, null); // Expected to return 700 and delete the key
         dump(oldVal3!!);
         
         // Confirm deletion: get should return null
         if (self.m.get(7) == null) {
             dump(1);
         } else {
             dump(0);
         }
    }
}
