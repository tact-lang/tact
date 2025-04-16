contract TestDeepEquals {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    receive() {
         // Populate both maps with same key-value pairs
         self.m1.set(1, 100);
         self.m1.set(2, 200);
         self.m2.set(1, 100);
         self.m2.set(2, 200);

         // Use deepEquals to compare the maps
         let areEqual: Bool = self.m1.deepEquals(self.m2);
         dump(areEqual); // Expected output: true
    }
}
