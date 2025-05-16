struct NestedStuff {
    a: Int;
    b: Bool?;
    c: Address;
    d: Cell?;
    e: Slice;
    f: String?;
}

contract TestContract {
    stuff: NestedStuff;

    init() {
        self.stuff = NestedStuff{
            a: 1,
            b: null,
            c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            d: null,
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }

    receive() {
        self.stuff = self.stuff;
    }
}