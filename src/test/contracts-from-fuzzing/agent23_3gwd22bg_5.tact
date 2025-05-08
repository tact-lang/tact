contract TryCatchContract {
    x: Int;

    init() {
        self.x = 10;
    }

    fun updateWithTry(): Int {
        try {
            self.x = 20;
            throw(1);
        } catch (err) {
            // Expecting state rollback: self.x remains 10
            return self.x;
        }
    }
}
