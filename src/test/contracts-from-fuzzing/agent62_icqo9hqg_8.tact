struct A {
    a1: Int;
    a2: Bool;
    a3: Address;
    a4: Cell;
    a5: Slice;
    a6: String;
    a7: String?;
    a8: Int?;
    a9: Bool?;
}

contract MixedTypes {
    storage: A;
    init() {
        self.storage = A{
            a1: 5,
            a2: true,
            a3: myAddress(),
            a4: emptyCell(),
            a5: emptyCell().asSlice(),
            a6: "test",
            a7: null,
            a8: null,
            a9: null,
        };
    }
}