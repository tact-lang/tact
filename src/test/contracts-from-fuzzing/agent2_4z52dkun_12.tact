struct SliceInt { s: Slice; val: Int }

asm(-> 1 0) fun asmLoadCoins(s: Slice): SliceInt { LDVARUINT16 }

asm fun chain(): Int { 1 PUSHINT 2 PUSHINT ADD }

asm(-> 1 0) extends mutates fun loadRef2(self: Slice): Cell { LDREF }
