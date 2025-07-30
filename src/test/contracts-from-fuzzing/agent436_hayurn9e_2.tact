struct A {
    v1: Int;
    v2: Bool;
    v3: String;
    v4: Address;
    v5: Cell;
    v6: Slice;
    v7: String?;
    v8: Bool?;
    v9: Int?;
    v10: Slice?;
}

contract TestContract {
    a: A;
    init() {
        self.a = A{
            v1: 1,
            v2: false,
            v3: "s",
            v4: myAddress(),
            v5: emptyCell(),
            v6: emptyCell().asSlice(),
            v7: null,
            v8: null,
            v9: null,
            v10: null,
        };
    }
}
