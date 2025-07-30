contract TestCashback() {
    receive() {
        cashback(sender());
    }
}
