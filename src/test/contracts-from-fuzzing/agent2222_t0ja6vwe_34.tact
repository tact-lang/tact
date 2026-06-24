struct NN {
    a: Int;
    b: Bool;
}

contract Nested {
    value: NN;

    init() {
        self.value = NN{ a:123, b:true };
    }
}