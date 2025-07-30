struct NegativeDefaults {
    amount: Int = -10;
}

contract Test {
    receive() {
        let v: NegativeDefaults = NegativeDefaults{};
    }
}