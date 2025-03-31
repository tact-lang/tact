contract TestMapDeepEqualsOrder {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    receive() {
         // Insert keys into m1 in one order
         self.m1.set(10, 100);
         self.m1.set(5, 50);
         self.m1.set(7, 70);

         // Insert keys into m2 in a different order
         self.m2.set(5, 50);
         self.m2.set(7, 70);
         self.m2.set(10, 100);

         // Check deep equality, which should be true regardless of insertion order
         let eq = self.m1.deepEquals(self.m2);
         if (!eq) {
             self.reply("Maps not equal".asComment());
         } else {
             self.reply("Maps equal".asComment());
         }
    }
}
