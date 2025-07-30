contract TestExpr {
    fun show() {
        // Testing integer literal with underscores
        let a = 1_000_000;
        dump(a);
    }
    
    receive() {
        self.show();
    }
}
