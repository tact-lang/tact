struct LastIsRemaining {
    a: Int;
    b: Slice as remaining;
}

contract RemainingInStruct {
    s: LastIsRemaining;
    init() {
        self.s = LastIsRemaining{ a:1, b:beginCell().endCell().asSlice() };
    }
}