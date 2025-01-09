asm fun asm_function_def_0(s: Slice): Int {
    1
    INT
    HASHEXT_KECCAK256
}

asm( -> 1 0) extends fun asm_function_def_1(self: Slice): Int {
    LDVARUINT16
}

asm(c b) extends fun asm_function_def_2(b: Builder, c: Cell) {
    STDICT
}

asm(s len -> 1 0) extends fun asm_function_def_3(self: Slice, len: Int): Int {
    LDIX
}
