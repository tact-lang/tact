const ADD: Int = 1 + 2;

fun test(): Int {
    return ADD;
}

contract TestContract {
    receive() {
        test();
    }
}
