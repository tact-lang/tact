/// Test assembly function with return arrangement for a two-field struct

// Define a simple Pair struct with two Int fields
struct Pair { fst: Int; snd: Int }

// The function takes two Int parameters and returns a Pair, but swaps their order using return arrangement
// Parameters pushed in order: a then b. SWAP changes order: stack becomes [b, a].
// Then return arrangement (-> 1 0) maps: 1 means the first field and 0 means the second field? Actually, note:
// Documentation: For a struct return type, fields are captured right-to-left: last field from top stack.
// So for Pair { fst, snd }, snd gets top, fst gets next value. With arrangement '-> 1 0', we reorder the two values: 
// This means: top becomes value from stack position 1 and next becomes value from position 0.
// Let's test: input: a=40, b=2. Initially stack: [40,2]. SWAP: [2,40]. After arrangement (-> 1 0): positions are swapped again, resulting in stack: [40,2].
// Finally, when capturing for struct Pair, right-to-left: snd = top = 2, fst = next = 40. So result is Pair { fst: 40, snd: 2 }.

asm(-> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

fun main() {
    let p = swapPair(40, 2); // expected Pair { fst: 40, snd: 2 }
}
