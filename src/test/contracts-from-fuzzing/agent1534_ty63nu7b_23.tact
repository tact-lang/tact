struct NestedRem {
    data: Slice as remaining;
}

contract RemNest {
    f: NestedRem;
    init() {
        self.f = NestedRem{ data: emptyCell().asSlice() };
    }
}