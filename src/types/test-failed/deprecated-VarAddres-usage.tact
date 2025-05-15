primitive Int;
primitive Slice;
trait BaseTrait {}

struct VarAddress {
    workchain: Int as int32;
    address: Slice;
}

contract Test {
    fun bar() {
        let addr = VarAddress {
            workchain: 0,
            address: emptySlice(),
        };
    }
}
