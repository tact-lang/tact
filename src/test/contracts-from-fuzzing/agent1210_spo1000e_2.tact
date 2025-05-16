struct Nested {
    a: Int;
    b: Bool;
    c: Address;
}

contract TestContract {
    val: Nested;

    init() {
        self.val = Nested{a: 7, b: true, c: myAddress()};
    }
}