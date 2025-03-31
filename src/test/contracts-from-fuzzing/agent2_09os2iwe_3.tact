contract TestCashback {
    // Using cashback in a receiver function as recommended
    receive() {
        cashback(sender());
    }
}
