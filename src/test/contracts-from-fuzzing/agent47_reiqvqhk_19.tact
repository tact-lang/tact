struct Pair { a: Int; b: Int }

// Assembly function with arrangement that swaps the order of two Ints
asm(-> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

fun testSwap(): Pair {
  return swapPair(100, 200);
}
