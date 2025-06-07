struct S2 {
    a: Int = 1;
    b: String?;
}

struct S1 {
    x: Int?;
    y: S2?;
}

contract NestedPersistOption {
    data: S1 = S1 { x: null, y: null };

    init() {
        self.data = S1 { x: 99, y: S2 { a: 55, b: null } };
    }
    receive() {}
}