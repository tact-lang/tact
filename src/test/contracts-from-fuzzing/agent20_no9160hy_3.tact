contract TestIfElse {
    field: Int = 0;

    receive() {
        let a: Int = 10;
        if (a > 5) {
            self.field = 1;
        } else {
            self.field = 2;
        }
    }
}
