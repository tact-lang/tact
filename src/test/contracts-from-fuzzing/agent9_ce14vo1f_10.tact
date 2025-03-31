contract ComplexMapOps {
    m1: map<Int, Int>;
    m2: map<Int, Int>;

    init() {
         // Initialize maps m1 and m2
         self.m1 = emptyMap();
         self.m2 = emptyMap();
         
         // Insert values into m1
         self.m1.set(1, 10);
         self.m1.set(2, 20);
         self.m1.set(3, 30);
         
         // Insert values into m2 in a different order
         self.m2.set(3, 30);
         self.m2.set(2, 20);
         self.m2.set(1, 10);
         
         // Test deepEquals and shallow equality
         let eqDeep: Bool = self.m1.deepEquals(self.m2);
         let eqShallow: Bool = (self.m1 == self.m2);
         dump(eqDeep);    // expected true
         dump(eqShallow); // expected true if serialization is identical
         
         // Iterate over m1 using a mutable local variable for summing values
         let total: Int = 0;
         // Note: local variables in Tact are mutable by default as seen in while loops
         total = total + 0; // to emphasize mutability, though not necessary
         
         // Using foreach iteration
         foreach (_, value in self.m1) {
              total = total + value;
         }
         dump(total);   // expected 10 + 20 + 30 = 60
         
         // Create a new map by modifying m1 entries (adding 5 to each value)
         let temp: map<Int, Int> = emptyMap();
         foreach (k, v in self.m1) {
              temp.set(k, v + 5);
         }
         self.m1 = temp;
         dump(self.m1.get(2)!!);  // expected 25
    }

    get fun value1(): Int {
         return self.m1.get(1)!!; // expected: 15 after modification
    }
}
