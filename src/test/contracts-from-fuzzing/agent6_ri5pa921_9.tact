contract FurtherMapsTesting {
    // Test 1: Deletion via setting null in set(), and via replace(), replaceGet()
    get fun testDeletion() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 101);
         m.set(2, 202);
         m.set(3, 303);
         // Delete key 1 via set(null)
         m.set(1, null);
         // Delete key 2 via replace
         let repDeleted = m.replace(2, null); // expected true
         
         // Insert a new key and use replaceGet to delete it
         m.set(3, 303);
         let repGetDeleted = m.replaceGet(3, null); // returns 303
         
         // Return accumulated result: (repDeleted?1:0) + repGetDeleted (if exists, else 0)
         return (repDeleted ? 1 : 0) + (repGetDeleted != null ? repGetDeleted!! : 0);
    }
    
    // Test 2: Iterate over an empty map after deletions, then reinsert keys in different order to test equality
    get fun testEqualityAndIteration() : Int {
         let m1: map<Int, Int> = emptyMap();
         m1.set(10, 100);
         m1.set(20, 200);
         
         let m2: map<Int, Int> = emptyMap();
         m2.set(20, 200);
         m2.set(10, 100);
         
         // deepEquals and shallow equality check
         let deq = m1.deepEquals(m2);
         let seq = (m1 == m2);
         
         // Delete all entries from m1
         m1.del(10);
         m1.del(20);
         
         // Check m1 emptiness via iteration.
         let count = 0;
         foreach (k, v in m1) {
             count = count + 1;
         }
         
         // Combine result: if both equal then add 100 and 200, plus bonus if m1 is empty
         return (deq ? 100 : 0) + (seq ? 200 : 0) + (m1.isEmpty() ? 1000 : 0) + count;
    }
    
    // Test 3: Stress test insertion and deletion (using unrolled insertion for 10 entries)
    get fun stressTest() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         m.set(3, 30);
         m.set(4, 40);
         m.set(5, 50);
         m.set(6, 60);
         m.set(7, 70);
         m.set(8, 80);
         m.set(9, 90);
         m.set(10, 100);
         
         // Sum the values: 10+20+...+100 = 550
         let s = m.get(1)!! + m.get(2)!! + m.get(3)!! + m.get(4)!! + m.get(5)!! + m.get(6)!! + m.get(7)!! + m.get(8)!! + m.get(9)!! + m.get(10)!!;
         
         // Delete even keys: 2,4,6,8,10
         m.del(2);
         m.del(4);
         m.del(6);
         m.del(8);
         m.del(10);
         
         // Count remaining keys (should be 5)
         let cnt = 0;
         foreach (k, v in m) {
             cnt = cnt + 1;
         }
         
         // Return s + 100 * cnt: 550 + 100*5 = 1050
         return s + 100 * cnt;
    }
}
