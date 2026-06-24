struct A {
    f1: Int?;
    f2: Bool?;
    f3: Cell?;
    f4: Slice?;
    f5: Builder?;
    f6: Address?;
}

contract OptionalEverywhere {
    a: A;
    init() {
        self.a = A{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null
        };
    }
}