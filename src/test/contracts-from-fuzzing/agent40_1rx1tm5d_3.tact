contract TestBool {
    receive() {
        dump(true);            // boolean literal true
        dump(false);           // boolean literal false
        dump(true || false);   // logical OR
        dump(false && true);   // logical AND
    }
}
