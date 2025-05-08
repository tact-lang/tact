contract SingleFieldContract {
    amount: Int;

    init() {
        self.amount = 1;
    }

    receive() {
        // no-op, just touch the persistent var
        self.amount = self.amount + 1;
    }
}