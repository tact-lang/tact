contract ExprBoolean {
    fun test() {
        let b1 = true;
        let b2 = false;
        // Evaluate (true || false) && !false, expected true
        let result = (b1 || b2) && (!b2);
        dump(result);
    }
    
    receive() {
        self.test();
    }
}
