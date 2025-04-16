struct Complex {
    foo: Int = 1;
    bar: Bool?;
    note: String = "hi";
}

contract MixedFields {
    complex: Complex = Complex{ foo: 5, bar: null, note: "x" };
    counter: Int;

    init() {
        self.counter = 99;
    }

    receive() {
        self.counter += 1;
    }
}