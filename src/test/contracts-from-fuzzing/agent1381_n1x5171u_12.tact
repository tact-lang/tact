struct A { val: Int; }

contract OptionalContractFieldNull {
    a: A?;

    init() {
        self.a = null;
    }
}