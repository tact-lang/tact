const ONE: Int = ton("1");

fun getOne(): Int {
    return ONE;
}

contract TestContract {
    receive() {
        getOne();
    }
}
