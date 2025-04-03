contract CashbackTester {
    /// For deployments
    receive() {}

    receive("Hello") {
        cashback(sender());
        emit("World".asComment());
    }

    receive("sender") {
        cashback(sender());
    }

    receive("myself") {
        cashback(myAddress());
    }
}
