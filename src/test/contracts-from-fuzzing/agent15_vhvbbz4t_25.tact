contract TestMapIterationOrder {
    first: Int = -1;
    m: map<Int, Int> = emptyMap();

    receive() {
         // Insert keys out-of-order
         self.m.set(10, 10);
         self.m.set(5, 5);
         self.m.set(7, 7);

         // Iterate over the map. According to documentation, keys should be in ascending order
         foreach (k, v in self.m) {
             if (self.first == -1) {
                 self.first = k; // should be the smallest key if iteration order is correct
             }
         }

         // Check if the first key is indeed the smallest (which is 5 in this test case)
         if (!(self.first == 5)) {
             self.reply("Iteration order bug: first key is not smallest".asComment());
         } else {
             self.reply("Iteration order ok".asComment());
         }
    }
}
