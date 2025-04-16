/*
   MapOrderTest verifies that the map iteration order in Tact is from smaller to bigger keys.
   According to the Tact documentation, when iterating over a map using a foreach loop, the keys are processed from the smallest value to the largest.

   In this test, we create a map<Int,Int>, set keys 100, 23, and 50, and then iterate over the map.
   During iteration, we require that each successive key is greater than or equal to the previous one.
   Finally, we require that the last key iterated is 100, which is the largest.
*/

contract MapOrderTest() {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(100, 1);
        m.set(23, 1);
        m.set(50, 1);
        
        let prev: Int = -1000;
        
        foreach (k, v in m) {
            require(k >= prev, "Map order error");
            prev = k;
        }
        
        require(prev == 100, "Final key error");
        cashback(sender());
    }
}
