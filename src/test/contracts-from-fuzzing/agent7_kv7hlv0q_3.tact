contract WhileTest {
    x: Int;

    init() {
        self.x = 0;
    }

    fun compute(): Int {
        while (self.x < 10) {
            self.x = self.x + 1;
        }
        return self.x;
    }
}
