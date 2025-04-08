struct ComplexField {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
}

contract TestContract {
    optField: ComplexField?;

    init() {
        self.optField = null;
    }

    receive() {
        self.optField = ComplexField{ i: 7, b: true, s: "hi", addr: myAddress() };
    }
}