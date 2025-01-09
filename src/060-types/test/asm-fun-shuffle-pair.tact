primitive Int;
struct Pair { fst: Int; snd: Int }

asm(-> 1 0) fun foo(x: Int, y: Int): Pair {
    SWAP
}
