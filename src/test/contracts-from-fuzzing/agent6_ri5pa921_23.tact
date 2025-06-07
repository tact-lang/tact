contract NegativeKeyTest {
    // Test that negative integer keys are accepted and work as expected
    get fun test() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(-5, -50);
         return m.get(-5)!!; // expected -50
    }
}

contract DiscardIteration {
    // Test iterating over a map and discarding both key and value
    get fun test() : Int {
         let m: map<Int, Int> = emptyMap();
         m.set(3, 30);
         m.set(4, 40);
         let cnt = 0;
         // Even though both key and value are discarded, we need to use identifiers in the foreach
         foreach (k, v in m) {
             // Discarding means we don't use them, e.g. assign to _ doesn't work here due to grammar restrictions
             cnt = cnt + 1;
         }
         return cnt; // expected 2
    }
}

contract FractionKeyTest {
    // Test that using an expression like 1/2 as key works as documented
    get fun test() : Int {
         let m: map<Int, Int> = emptyMap();
         // In Tact, integer division 1/2 evaluates to 0
         m.set(1 / 2, 111);
         return m.get(0)!!; // expected 111, since 1/2 is 0
    }
}
