struct X { a: Int; }

contract ParamsX(
    prm1: Int,
    prm2: String,
    prm3: Bool?,
    prm4: X,
) {
    receive() {
        // Noop, just test params usage
    }
}
