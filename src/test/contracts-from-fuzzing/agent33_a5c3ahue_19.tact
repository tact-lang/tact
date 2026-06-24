contract Test {
    receive() {
        // Test: Verify that converting a string to a Cell via asComment() produces the same result
        // as building a comment using a StringBuilder from beginComment().

        let s: String = "When life gives you lemurs, you must dance.";
        let c1: Cell = s.asComment();

        let sb: StringBuilder = beginComment();
        sb.append(s);
        let c2: Cell = sb.toCell();

        if (c1 == c2) {
            dump("Match");
        } else {
            dump("Mismatch");
        }
    }

    fun dump(s: String) {
        // No-op dump function
    }
}
