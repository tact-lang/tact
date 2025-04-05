contract Test {
    fun maybe(i: Int): Int? {
        if (i > 0) {
            return i;
        }
        return null;
    }

    receive() {
        self.maybe(-1);
    }
}