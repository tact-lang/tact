contract CashbackTest {
    receive() {
        cashback(sender());
    }
}
