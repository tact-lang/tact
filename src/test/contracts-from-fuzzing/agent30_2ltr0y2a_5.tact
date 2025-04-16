fun getValue(): Int {
    return 42;
}

contract Test {
    receive() {
        let val = getValue();
        dump(val);
    }
}
