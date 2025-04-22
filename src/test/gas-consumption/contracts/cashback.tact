contract Cashback {
    receive() {
        cashback(sender());
    }
}
