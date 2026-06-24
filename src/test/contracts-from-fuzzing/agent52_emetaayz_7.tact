contract TestNestedIf {
    receive() {
        let a: Int = 5;
        if (a == 5) {
            dump(1);
        } else if (a > 5) {
            dump(2);
        } else {
            dump(3);
        }
    }
}
