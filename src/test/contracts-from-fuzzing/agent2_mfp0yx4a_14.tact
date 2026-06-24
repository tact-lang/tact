extends mutates fun increment(self: Int) {
    self += 1;
}

fun testMinMax(): Int {
    return max(3, 2) - min(3, 2);
}

contract ChainTest {
    receive() {
         let a: Int = 0;
         a.increment();
         a.increment();
         // Expected: a becomes 2
         dump(a);
         cashback(sender());
    }
}

contract MinMaxTest {
    receive() {
         dump(testMinMax()); // Expected: max(3,2)=3 and min(3,2)=2 so result = 1
         cashback(sender());
    }
}

contract CommentTest {
    receive() {
         // Convert the string to a Cell prepared as a message body comment
         let c: Cell = "Hello, World!".asComment();
         // Convert cell to slice and then get bit length
         let s: Slice = c.asSlice();
         dump(s.bits());
         cashback(sender());
    }
}

// Extension function already defined above
extends fun inc(self: Int): Int {
   return self + 1;
}

contract ExtensionTest {
    receive() {
         let a: Int = 5;
         dump(a.inc()); // Expected 6
         cashback(sender());
    }
}

fun testUnary(): Int {
    // According to operator precedence: ~(-5) should yield 4
    return ~(-5);
}

contract UnaryTest {
    receive() {
         dump(testUnary()); // Expected 4
         cashback(sender());
    }
}
