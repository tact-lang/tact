struct Nested {
    txt: String;
    addr: Address?;
}

contract TestContract {
    field: Nested;

    init() {
        self.field = Nested{
            txt: "abc",
            addr: null
        };
    }
}