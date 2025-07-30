struct S {
    value: Int?;
}

contract TestContract {
    s: S = S{ value: null };
    value: Int = 123;

    init() {
        self.s = S{ value: 42 };
        self.value = 999;
    }
}