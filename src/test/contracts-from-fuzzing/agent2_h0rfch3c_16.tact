///////////////////////////////
// Test 15 (corrected): Using wildcard discard in foreach loop over a map

contract Test {
    receive() {
         let quartiles: map<Int, Int> = emptyMap();
         quartiles.set(1, 25);
         quartiles.set(2, 50);
         quartiles.set(3, 75);

         // Discard both key and value using wildcards in foreach loop
         foreach (_, _ in quartiles) {
             // Loop body intentionally empty
         }

         dump(42);
    }
}
