asm extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT }

fun main() {
    let b: Builder = beginCell();
    let b2 = b.asmStoreDict(null);
}
