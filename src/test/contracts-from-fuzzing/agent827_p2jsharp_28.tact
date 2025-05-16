contract OptionalSliceVar {
    saved: Slice? = null;

    receive() {
        self.saved = emptyCell().asSlice();
    }
}