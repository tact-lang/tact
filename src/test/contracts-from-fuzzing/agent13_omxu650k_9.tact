contract Test {
    receive() {
        // Testing conversion from String to Slice and back to String
        let s: String = "TactCompiler";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        dump(s2);
    }
}
