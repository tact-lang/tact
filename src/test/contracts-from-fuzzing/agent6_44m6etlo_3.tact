contract TestCashback() {
    receive() {
         cashback(sender());
    }
}

// Dummy contract to ensure full compilation
contract Dummy() {}