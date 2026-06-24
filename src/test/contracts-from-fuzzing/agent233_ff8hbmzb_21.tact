contract NullThenAssign {
    x: Int? = null;

    init() {
        self.x = 42;
    }

    receive() {
        let _ = self.x;
    }
}