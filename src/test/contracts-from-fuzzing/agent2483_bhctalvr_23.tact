fun square(x: Int): Int {
    return x * x;
}

contract TestContract {
    val: Int = square(5);
    receive() {
        square(2);
    }
}