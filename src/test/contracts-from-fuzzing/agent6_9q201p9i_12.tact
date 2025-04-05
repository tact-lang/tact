contract TestSlice() {
    // Constant evaluated using the slice built-in function
    // This should produce a Slice corresponding to the provided base64 string
    const slice_val: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive() {
        // Dump the number of bits in the slice to inspect the result
        dump(self.slice_val.bits());
        cashback(sender());
    }
}
