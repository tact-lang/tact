contract ComprehensiveMaps {
    get fun test() : Int {
         // Test A: Basic insertion and deletion
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         // Delete key 1
         let delSuccess = m.del(1); // should be true
         // Attempt to get deleted key with fallback using ternary operator
         let tmp = m.get(1);
         let val1 = tmp != null ? tmp!! : 0;
         let val2 = m.get(2)!!; // should be 20 initially
         
         // Test B: Replace and ReplaceGet operations
         // Try replacing non-existing key
         let repNonExist = m.replace(3, 30); // expected false
         // Replace existing key 2
         let repSuccess = m.replace(2, 22);   // expected true
         // ReplaceGet: should return old value (22) and update it to 33
         let oldVal = m.replaceGet(2, 33);     // returns 22
         
         // Test C: deepEquals and shallow equality
         let m2: map<Int, Int> = emptyMap();
         m2.set(2, 33);
         let deepEq = m.deepEquals(m2);        // should be true
         let shallowEq = (m == m2);              // should be true
         
         // Test D: asCell conversion
         let cell = m.asCell();                // expected to be non-null because m contains an entry
         
         // Test E: Iteration over map using foreach
         let sum = 0;
         foreach (k, v in m) {
             sum = sum + v;
         }
         
         // Combine results. Expected:
         //  delSuccess: true -> 1
         //  val1: 0 (since key 1 was deleted)
         //  m.get(2): should now be 33 after replacementGet
         //  repNonExist: false -> 0
         //  repSuccess: true -> 1
         //  oldVal: 22
         //  deepEq contributes 100
         //  shallowEq contributes 200
         //  cell non-null contributes 1000
         //  sum: sum of values in m; only key 2 remains with value 33
         // Total = 1 + 0 + 33 + 0 + 1 + 22 + 100 + 200 + 1000 + 33 = 1390
         
         return (delSuccess ? 1 : 0) + val1 + m.get(2)!! + (repNonExist ? 1 : 0) + (repSuccess ? 1 : 0) + (oldVal != null ? oldVal!! : 0) + (deepEq ? 100 : 0) + (shallowEq ? 200 : 0) + (cell != null ? 1000 : 0) + sum;
    }
}
