/// Snippet: arrangedFuncCorrected
/// This snippet tests the combined use of argument and result arrangement in an asm function.
/// According to documentation, the arrangement must mention all parameters in a rearranged order.
/// Here, we use "asm(b a -> 1 0)" to indicate that parameter 'b' is pushed first and 'a' second, and then the result arrangement reverses the capturing order: the top of the stack becomes Pair.first (capturing 'a') and the next becomes Pair.second (capturing 'b').

struct Pair { first: Int; second: Int }

asm(b a -> 1 0) fun arrangedFunc(a: Int, b: Int): Pair { }

fun main() {
    let p = arrangedFunc(10, 20);
}
