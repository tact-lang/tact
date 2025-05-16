const HALF_TON: Int = ton("0.5");

contract TestTonHalf() {
    receive() {
        dump(HALF_TON); // Expected output: 500000000
    }
}
