contract TestMapModifyInForeach {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Initialize map
         self.m.set(1, 10);
         self.m.set(2, 20);
         self.m.set(3, 30);
         
         // Loop over the map while modifying its entries
         foreach (k, v in self.m) {
             // Update the value for the current key, incrementing by 1
             self.m.set(k, v + 1);
         }
    }
}
