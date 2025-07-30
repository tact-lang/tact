struct Pair { first: Int; second: Int }

// The asm function takes two Int parameters. They are pushed as: first pushed is x, then y on top.
// The body pushes x then y and uses arrangement (-> 1 0) to swap their order so that the top becomes first value.
asm(-> 1 0) fun pairSwap(x: Int, y: Int): Pair {
    x PUSHINT
    y PUSHINT
}

fun main() : Int {
    let p: Pair = pairSwap(100, 200);
    // Since arrangement swapped the two, p.first should be 200 and p.second 100.
    return p.first; 
}
