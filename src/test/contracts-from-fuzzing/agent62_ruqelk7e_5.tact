fun getNumber(): Int {
    return 100;
}

contract TestReturn {
    receive() {
        let res = getNumber();
        dump(res);
    }
}
