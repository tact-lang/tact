asm fun swapDrop(a: Int, b: Int): Int {
  SWAP
  DROP
}

fun test(): Int {
  return swapDrop(10, 20); // leaves 10 on the stack
}
