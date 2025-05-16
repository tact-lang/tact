fun retFun(): Int {
    return 100;
}

contract TestReturn {
    receive() {
        dump(retFun());
    }
}
