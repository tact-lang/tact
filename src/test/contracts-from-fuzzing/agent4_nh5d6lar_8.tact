struct SliceInt { s: Slice; val: Int }

asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

fun test(slice: Slice, n: Int): SliceInt {
  return asmLoadInt(n, slice);
}
