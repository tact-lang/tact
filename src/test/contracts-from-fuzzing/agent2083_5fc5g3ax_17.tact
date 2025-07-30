struct BoolDefault {
    flag: Bool = true;
}

contract StructWithBoolDefault {
    d: BoolDefault;

    init() {
        self.d = BoolDefault{};
    }
}
