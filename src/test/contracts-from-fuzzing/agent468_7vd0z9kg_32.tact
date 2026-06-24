// Struct with optional slice initialized in contract field default
struct SliceOptStruct {
    s: Slice?;
}

contract SliceOptDefault {
    val: SliceOptStruct = SliceOptStruct{ s: null };

    init() {
        self.val = SliceOptStruct{ s: emptyCell().asSlice() };
    }
}