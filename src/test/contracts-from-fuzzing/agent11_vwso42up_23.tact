contract RecursiveGetter {
    receive() {}

    // Getter that computes factorial recursively using self-recursion
    get fun rec(x: Int): Int {
        if (x <= 0) {
            return 1;
        } else {
            return self.rec(x - 1) * x;
        }
    }
}
