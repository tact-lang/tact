contract TestCommentCorrect {
    receive() {
        // Test: Verify that using asComment() directly on a string produces the same result as building it
        // manually with a StringBuilder via beginComment() and toCell().
        let commentStr: String = "This is a comment.";
        let cell1: Cell = commentStr.asComment();

        let sb: StringBuilder = beginComment();
        sb.append(commentStr);
        let cell2: Cell = sb.toCell();

        // According to best practices (e.g.  and docs_cookbook_misc.md), if the two cells differ,
        // we should signal an error; use require() to enforce the expectation.
        require(cell1 == cell2, "Comment cells do not match");
    }
}
