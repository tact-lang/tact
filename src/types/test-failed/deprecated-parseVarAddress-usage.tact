primitive Int;
primitive Slice;
trait BaseTrait {}

struct VarAddress {
    workchain: Int as int32;
    address: Slice;
}

asm fun parseVarAddress(slice: Slice): VarAddress { REWRITEVARADDR }

contract Test {
    fun bar() {
        let addr = parseVarAddress(emptySlice())
    }
}
