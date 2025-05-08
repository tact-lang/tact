struct HasOptSlice {
    s: Slice?;
    c: Cell?;
    b: Builder?;
}

contract TestContract {
    o: HasOptSlice;

    init() {
        self.o = HasOptSlice { s: null, c: null, b: null };
    }
}