contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Set a value for an existing key
         self.m.set(10, 50);

         // Replace an existing key-value pair - should return true
         let r1: Bool = self.m.replace(10, 100);
         dump(r1); // expecting true

         // Try to replace a non-existing key - should return false
         let r2: Bool = self.m.replace(20, 200);
         dump(r2); // expecting false

         // Replace existing key with null to delete it - should return true
         let r3: Bool = self.m.replace(10, null);
         dump(r3); // expecting true

         // Check that key 10 is now deleted
         if (self.m.get(10) == null) {
             dump(0); // confirms deletion
         } else {
             dump(1);
         }
    }
}
