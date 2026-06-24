struct AB { a: Int; b: Int }

struct Nested { left: AB; right: AB }

// This assembly function takes a Nested struct and returns the sum of all four integers.
// The Nested struct is flattened onto the stack as: n.left.a, n.left.b, n.right.a, n.right.b
// with n.right.b at the top of the stack. The RPN instructions ADD ADD ADD will sum them all.
asm fun sumNested(n: Nested): Int { ADD ADD ADD }

contract Test2 {
    receive() {}
    
    fun test(): Int {
        // Expected sum: 10 + 20 + 30 + 40 = 100
        return sumNested(Nested { left: AB { a: 10, b: 20 }, right: AB { a: 30, b: 40 } });
    }
}
