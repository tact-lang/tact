struct Nested {
    n1: Int;
    n2: Bool?;
    n3: String;
}

struct Complex {
    f1: Int?;
    f2: Bool;
    f3: String?;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Nested;
}

contract Test {
    value: Complex;

    init() {
        self.value = Complex{
            f1: null,
            f2: true,
            f3: "hello",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
            f8: Nested{ n1:1, n2:true, n3:"abc" }
        };
    }
}
