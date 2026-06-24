trait HasField {
    counter: Int;
}

contract InheritAndAdd with HasField {
    counter: Int;
    value: Int;
    init() {
        self.counter = 10;
        self.value = 20;
    }
    receive() {}
}