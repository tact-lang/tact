contract TestBitPaddedString {
    receive() {
        // rawSlice("41_") => tries to bit-pad the hex 0x41 (which is 'A')
        // This results in a partial bit string.
        let partial: Slice = rawSlice("41_");
        // Now let's try converting it to string.
        // Documentation says that if the number of bits is not divisible by 8, we expect an exception.
        let attempt: String = partial.asString();
        dump(attempt);
    }
}