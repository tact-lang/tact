contract TestTailVsComment {
    receive() {
        // Test that beginTailString and beginComment produce different prefixes in the resulting strings
        let sbTail: StringBuilder = beginTailString();
        sbTail.append("Test");
        let sTail: String = sbTail.toString();
        
        let sbComment: StringBuilder = beginComment();
        sbComment.append("Test");
        let sComment: String = sbComment.toString();
        
        // As the two builders use different prefixes, the resulting strings should not be equal
        let eq: Bool = sTail.asSlice() == sComment.asSlice();
    }
}
