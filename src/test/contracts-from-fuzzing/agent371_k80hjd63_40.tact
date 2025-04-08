struct NestedMixed {
    intVal: Int;
    boolVal: Bool;
    optInner: Inner?;
}

struct Inner {
    strVal: String;
    sliceVal: Slice;
}

contract TestContract {
    val: NestedMixed;

    init() {
        self.val = NestedMixed{
            intVal:42,
            boolVal:true,
            optInner:Inner{ strVal:"ok", sliceVal:emptyCell().asSlice() }
        };
    }
}
