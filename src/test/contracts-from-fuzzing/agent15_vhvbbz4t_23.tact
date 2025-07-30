contract TestMapDeleteInForeach {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Initialize map entries
         self.m.set(1, 10);
         self.m.set(2, 20);
         self.m.set(3, 30);

         // Remove keys during iteration
         foreach (k, v in self.m) {
             self.m.del(k);
         }

         // Confirm that the map is empty
         let isEmpty = self.m.isEmpty();
         // Use the result in a dummy operation
         if (!isEmpty) {
             self.reply("Map not empty".asComment());
         } else {
             self.reply("Map is empty".asComment());
         }
    }
}
