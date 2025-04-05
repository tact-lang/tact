contract TestOptional {
    receive() {
        let op: Int? = null;
        op = 100;
        if (op != null) {
            dump(op!!);
        } else {
            dump(0);
        }
    }
}
