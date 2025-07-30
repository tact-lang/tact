contract Test {
    receive() {
        let comment: StringBuilder = beginComment();
        let longString: String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"; // > 127 chars
        comment.append(longString);
        dump(comment.toCell());
    }
}