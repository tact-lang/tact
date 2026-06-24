contract Test {
    // simple receiver contract
    receive() { cashback(sender()) }
}
