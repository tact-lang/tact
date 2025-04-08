contract SingleIntVar {
    val: Int = 42;

    receive() {
        dump(self.val);
    }
}