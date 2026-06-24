contract SinglePrimitiveInt {
    number: Int;

    init() {
        self.number = 42;
    }

    receive() {
        self.number += 1;
    }
}