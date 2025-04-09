contract TestAsCell {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Before any insertion, asCell() should return null
         if (self.m.asCell() == null) {
             dump(0); // expected 0 for true branch
         } else {
             dump(1);
         }
         
         // Insert a key-value pair
         self.m.set(1, 100);
         
         // Now, asCell() should not be null
         if (self.m.asCell() != null) {
             dump(2); // expected 2 for true branch
         } else {
             dump(3);
         }
    }
}
