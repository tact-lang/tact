fun test(arg: Int?) {
    dump(arg);
}

contract TestContract {
    receive() {
        test(null);
    }
}
