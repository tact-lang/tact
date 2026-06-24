struct S { a: Int; b: Bool = false; c: String = ""; d: Int?; }

contract DefaultsOpt {
    value: S;

    init() {
        self.value = S{ a: 42 };
    }
}
