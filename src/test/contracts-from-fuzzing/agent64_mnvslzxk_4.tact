const GLOBAL_CONSTANT: Int = 1000 + ton("42") + pow(10, 9);

contract TestContract {
    receive() {
        dump(GLOBAL_CONSTANT);
    }
}
