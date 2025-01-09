asm extends fun hash(self: Cell): Int { HASHCU }

asm extends fun hash(self: Slice): Int { HASHSU }

asm fun checkSignature(hash: Int, signature: Slice, public_key: Int): Bool { CHKSIGNU }

asm fun checkDataSignature(data: Slice, signature: Slice, public_key: Int): Bool { CHKSIGNS }
