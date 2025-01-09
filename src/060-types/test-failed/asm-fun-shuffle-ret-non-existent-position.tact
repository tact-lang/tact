primitive Int;
struct Pair { fst: Int; snd: Int }

asm(-> 2 1 0) fun foo(x: Int, y: Int): Pair {
    SWAP
}
