contract EscTest {
    receive() {
        let s: String = "This is a new line:\nAnd a tab:\tand a quote: \"";
        let _comment: Cell = s.asComment();
    }
}
