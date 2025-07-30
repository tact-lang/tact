contract ConstSliceTest() {
    // Testing compile-time evaluation of slice() built-in with a valid Base64 string for Slice
    const slice_val: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive() {
        let s: Slice = self.slice_val;
        cashback(sender());
    }
}
