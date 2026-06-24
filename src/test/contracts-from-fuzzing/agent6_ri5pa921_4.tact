contract AdvancedMaps {
    get fun test() : Int {
         // Test A: Using set with null to delete an entry
         let m: map<Int, Int> = emptyMap();
         m.set(1, 111);
         m.set(1, null); // should delete key 1
         
         // Test B: Using replace with null to delete an entry
         m.set(2, 222);
         let repNull = m.replace(2, null); // expected true
         
         // Test C: Using replaceGet with null to delete an entry
         m.set(3, 333);
         let repGetNull = m.replaceGet(3, null); // expected to return 333 and delete key 3
         
         // Test D: Check iteration - at this point, keys 1, 2, 3 have been deleted; map should be empty
         let count = 0;
         foreach (k, v in m) {
             count = count + 1;
         }
         
         // Test E: Compare two maps built in different orders
         let m1: map<Int, Int> = emptyMap();
         m1.set(10, 100);
         m1.set(20, 200);
         
         let m2: map<Int, Int> = emptyMap();
         m2.set(20, 200);
         m2.set(10, 100);
         
         let deq = m1.deepEquals(m2); // expected true because they have same entries
         let seq = (m1 == m2);          // expected to be true if hash equality works consistently
         
         // Combine all test results into one integer result
         // repNull (true -> 1), repGetNull returns 333
         // deq true contributes 100, shallow eq true contributes 200
         // count is the number of entries remaining in m (should be 0)
         // Final result:
         // 1 + 333 + 100 + 200 + count = 634
         
         return (repNull ? 1 : 0) + (repGetNull != null ? repGetNull!! : 0) + (deq ? 100 : 0) + (seq ? 200 : 0) + count;
    }
}
