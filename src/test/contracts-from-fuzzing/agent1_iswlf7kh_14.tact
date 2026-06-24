contract TestStringEquality {
    receive() {
        // Test whether Unicode escape yields same string literal as direct emoji in literal
        let a: String = "\u{1F643}"; // 🙃
        let b: String = "🙃";
        // Check equality by converting to slices
        let eq: Bool = a.asSlice() == b.asSlice();
    }
}
