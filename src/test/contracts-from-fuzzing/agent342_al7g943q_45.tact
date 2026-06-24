struct SingleOptionalInt {
    v: Int?;
}

contract SingleOptionalIntContract {
    f: SingleOptionalInt;

    init() {
        self.f = SingleOptionalInt{ v: null };
    }
}
