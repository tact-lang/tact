contract TestInline4 {
    result: Int;

    inline fun add(a: Int, b: Int): Int {
        return a + b;
    }

    init() {
        self.result = 0;
    }

    // Non-getter function to perform inline addition after init
    fun performAddition() {
        self.result = self.add(3, 4);
    }

    get fun getResult(): Int {
        return self.result;
    }
}
