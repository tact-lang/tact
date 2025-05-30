contract UnicodeEscapeTest {
    receive() {
        let s: String = "\x41\u0042\u{43} and a lightning: \u26A1 and laughing: \u{1F602}";
        let _slice: Slice = s.asSlice();
    }
}
