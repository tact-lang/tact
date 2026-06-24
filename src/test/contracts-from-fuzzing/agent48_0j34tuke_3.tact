const MY_CONSTANT: Int = 42;

fun getConstant(): Int {
    return MY_CONSTANT;
}

contract TestContract {
    receive() {
        getConstant();
    }
}
