fun getValue(): Int {
    return 10;
}

contract Test1 {
    receive() {
        let x: Int = getValue();
    }
}