contract TestMapDeepEquals {
    // This contract tests shallow and deep equality of maps
    get fun test(): Int {
         let m1: map<Int, Int> = emptyMap();
         let m2: map<Int, Int> = emptyMap();

         // Set identical entries in both maps
         m1.set(1, 42);
         m1.set(2, 84);
         m2.set(1, 42);
         m2.set(2, 84);

         // Shallow equality using '==' compares the map hashes
         let shallowEqual: Bool = (m1 == m2);
         // deepEquals compares the actual entries
         let deepEqual: Bool = m1.deepEquals(m2);

         // Return values based on comparison: 0 if both equal, distinct error codes otherwise
         if (!shallowEqual) { return 1; }
         if (!deepEqual) { return 2; }

         // Now modify one map
         m2.replace(2, 100);

         let shallowEqual2: Bool = (m1 == m2);
         let deepEqual2: Bool = m1.deepEquals(m2);

         if (shallowEqual2) { return 3; }  // Expect false
         if (deepEqual2) { return 4; }       // Expect false

         return 0;
    }
}
