/// This test verifies recursive function calls defined in a trait.
/// The trait RecTrait defines a factorial function 'fact' that recursively computes factorial.

trait RecTrait {
    fun fact(n: Int): Int {
        if (n <= 1) {
            return 1;
        } else {
            // Recursive call via self, ensuring trait function invocation
            return n * self.fact(n - 1);
        }
    }
}

contract Factorial() with RecTrait {
    receive() {
        // Compute factorial of 5, expected result 120
        let res = self.fact(5);
        reply(res.toString());
    }
}

// Global inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters {
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
