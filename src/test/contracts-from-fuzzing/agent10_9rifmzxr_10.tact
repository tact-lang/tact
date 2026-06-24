struct BuiltinCells {
    c: Cell;
    s: Slice;
    rs: Slice;
}

contract TestBuiltinEval {
    // Compile-time evaluation of built-in functions for cell, slice and rawSlice
    const c: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    const s: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    const rs: Slice = rawSlice("000DEADBEEF000");

    get fun getCells(): BuiltinCells {
        return BuiltinCells{
            c: self.c,
            s: self.s,
            rs: self.rs
        };
    }

    receive() {
        cashback(sender());
    }
}
