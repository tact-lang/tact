fun get42(): Int {
    return 42;
}

contract TestReturn {
    receive() {
        let value: Int = get42();
        dump(value);
    }
}
