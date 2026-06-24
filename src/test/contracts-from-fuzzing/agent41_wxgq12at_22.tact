struct StructWithBoolDefault {
    yes: Bool = false;
    count: Int;
}

contract StructDefaultBool {
    s: StructWithBoolDefault;

    init() {
        self.s = StructWithBoolDefault{
            count: 42,
        };
    }
}
