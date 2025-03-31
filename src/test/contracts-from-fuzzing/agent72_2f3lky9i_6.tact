contract Test {
    receive() {
        let b: Builder = beginCell();
        try {
            // Attempt to store an out-of-bound integer value into a builder
            // Valid range for storeVarInt32 is from -2^247 to 2^247 - 1, so (1 << 247) is out-of-bound.
            let b2: Builder = b.storeVarInt32(1 << 247);
            dump(0);
        } catch (err) {
            // Expect an error with exit code 5: "Integer out of expected range"
            dump(err);
        }
    }
}
