struct Pair { first: Int; second: Int }

// This assembly function uses no argument arrangement, so the input Pair is flattened as:
// s1 = pair.first, s0 = pair.second.
// The result arrangement '-> 1 0' reorders the captures: it takes s1 then s0,
// and since struct fields are captured right-to-left (last field gets s0, first gets s1),
// the resulting Pair will have first = original second, and second = original first.

asm(-> 1 0) fun swapPair(pair: Pair): Pair { }

fun main() {
    let original = Pair { first: 10, second: 20 };
    let swapped = swapPair(original);
    // Expected: swapped.first == 20, swapped.second == 10
}
