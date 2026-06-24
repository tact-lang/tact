contract Test {
    receive() {
        // Testing string equality by comparing their slices using the == operator
        let s1: String = "hello";
        let s2: String = "hello";
        let eq: Bool = s1.asSlice() == s2.asSlice();
        // Using eq in an empty if to ensure it's compiled
        if (eq) {
            // do nothing
        } else {
            // do nothing
        }
    }
}
