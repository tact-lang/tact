contract TestUnicode {
    receive() {
        // Testing Unicode escape sequences with variable length using \u{...}
        let s: String = "\u{1F602} LOL \u{1F602}"; // \u{1F602} represents 😂
        // Cast string to slice and back to string
        let sliceValue: Slice = s.asSlice();
        let s2: String = sliceValue.asString();
        // Compare and assert equality via cell printing
        let b: StringBuilder = beginString();
        b.append(s);
        let cell1: Cell = b.toCell();
        b = beginString();
        b.append(s2);
        let cell2: Cell = b.toCell();
    }
}
