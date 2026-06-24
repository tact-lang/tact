struct NestedFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
}

contract TestContract {
    data: NestedFields;

    init() {
        self.data = NestedFields{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: null,
        };
    }
}