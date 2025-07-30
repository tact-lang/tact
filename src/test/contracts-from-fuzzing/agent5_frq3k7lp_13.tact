asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

struct SliceInt { s: Slice; val: Int }