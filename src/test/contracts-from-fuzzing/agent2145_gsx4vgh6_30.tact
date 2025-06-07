struct DeepWithRem {
    inner: MidWithRem;
    val: Int;
}

struct MidWithRem {
    prop: Bool;
    rem: Slice as remaining;
}

contract StorageTest {
    val: DeepWithRem;

    init() {
        self.val = DeepWithRem{
            inner: MidWithRem{ prop:true, rem:emptyCell().asSlice() },
            val: 42
        };
    }
}