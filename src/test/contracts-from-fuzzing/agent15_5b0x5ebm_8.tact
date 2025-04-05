contract TestBoolExpr {
    receive() {
        // Test boolean literal and logical operators
        dump(true);              // should output true
        dump(false);             // should output false
        dump(true && false);     // expected false
        dump(true || false);     // expected true
        dump(!true);             // expected false
    }
}
