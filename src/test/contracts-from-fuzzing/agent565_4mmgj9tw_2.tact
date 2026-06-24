struct Nested {
    a: Int;
    b: Bool?;
    c: Address;
}

contract TestContract {
    val: Nested;
    init() {
        self.val = Nested{
            a: 42,
            b: true,
            c: myAddress(),
        };
    }
}