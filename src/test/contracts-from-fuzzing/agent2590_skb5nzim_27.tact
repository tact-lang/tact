struct CellSliceOptional {
    a: Cell?;
    b: Slice?;
}

contract CellOptContract {
    foo: CellSliceOptional;
    init() {
        self.foo = CellSliceOptional{ a: null, b: null };
    }
}