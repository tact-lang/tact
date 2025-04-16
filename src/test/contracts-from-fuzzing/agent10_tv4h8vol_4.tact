contract NestedIf {
    receive() {
        let a: Int = 5;
        if (a > 0) {
            if (a > 10) {
                dump(1);
            } else {
                dump(2);
            }
        } else {
            dump(3);
        }
    }
}
