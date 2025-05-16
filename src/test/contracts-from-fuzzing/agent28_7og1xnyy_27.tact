contract TestStringAsComment {
    receive() {
        // Testing the asComment() extension on String
        // It returns a Cell with the string prefixed by four null bytes
        let txt: String = "Test comment";
        let c: Cell = txt.asComment();
        dump(c);
    }
}
