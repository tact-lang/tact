contract TestMapReassign {
    // Persistent state variable declared
    m: map<Int, Int>;

    // Constructor (initialization) function for the contract
    init() {
         self.m = emptyMap();
         self.m.set(2, 200);
    }

    // Getter function to test reassignment of the map
    get fun test(): Int {
         // Reassign to an empty map; should delete all previous entries
         self.m = emptyMap();
         let res1 = self.m.exists(2) ? 0 : 21; // expected: key 2 is deleted, so res1 = 21

         // Now reassign m to null, equivalent to emptyMap()
         self.m = null;
         let res2 = self.m == null ? 21 : 0;  // res2 expected to be 21

         return res1 + res2; // Expected result: 42
    }
}
