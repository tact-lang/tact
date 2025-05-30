contract TestTrailingBackslash {
    receive() {
        // Test a string ending with a backslash. To produce a literal backslash at the end,
        // we use "\\" (which represents one backslash) in the source,
        // but to safely terminate, we need to write "hello\\".
        // However, if we want the string to end with a literal backslash, we must double escape.
        // In Tact, a literal backslash is produced by "\\". To have the string "hello\" (hello followed by one backslash),
        // we need to write: "hello\\". 
        // We'll test that this string is accepted and can be converted to a slice.
        let s: String = "hello\\"; 
        let sl: Slice = s.asSlice();
        sl;
    }
}
