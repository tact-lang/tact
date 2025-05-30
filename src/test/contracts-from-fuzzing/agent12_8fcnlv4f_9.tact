const negHalfTon: Int = ton("-0.5");

contract TestNegTon() {
    get fun getNegHalfTon(): Int {
        return negHalfTon;
    }

    // Dummy receiver
    receive() {}
}
