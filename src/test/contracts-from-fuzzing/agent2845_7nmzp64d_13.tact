struct OptInt {
    v: Int?;
}

contract InitNullOpt {
    d: OptInt;

    init() {
        self.d = OptInt{ v: null };
    }
}