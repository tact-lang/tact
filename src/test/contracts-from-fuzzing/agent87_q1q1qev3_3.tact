contract TestBoolLiteral {
    receive() {
        // Testing boolean literal expressions
        let flag1: Bool = true;
        let flag2: Bool = false;
        if (flag1 && !flag2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
