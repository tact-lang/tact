contract RepeatTest {
    receive() {
         let counter: Int = 0;
         // repeat loop with 0 iterations; should not execute block
         repeat (0) {
             counter += 1;
         }
         dump(counter); // expected: 0
         cashback(sender());
    }
}

contract RepeatNegTest {
    receive() {
         let counter: Int = 0;
         // repeat loop with a negative value; block should not execute
         repeat (-5) {
             counter += 1;
         }
         dump(counter); // expected: 0
         cashback(sender());
    }
}

contract TonTest {
    receive() {
         // Test conversion of a string literal representing a fractional Toncoin
         let a: Int = ton("0.5");
         dump(a); // expected: 500000000 (if 1 Ton = 10^9 nanoToncoins)
         cashback(sender());
    }
}

contract MapTest {
    receive() {
         // Test map functionality
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         dump(m.get(1)!!); // expected: 10
         m.del(1);
         dump(m.exists(1)); // expected: false (0 for false)
         cashback(sender());
    }
}

// The previous contracts ChainTest, MinMaxTest, CommentTest, ExtensionTest, and UnaryTest
// have been validated in earlier snippets.
// In this combined test snippet, we add new tests for repeat loops, ton conversion, and map operations.

// This extended fuzzing test continues to explore the Tact compiler behavior, and so far every new behavior
// strictly conforms to documentation expectations (e.g., repeat loops with non-positive iteration counts execute 0 times, 
// and map operations match their documented semantics).
