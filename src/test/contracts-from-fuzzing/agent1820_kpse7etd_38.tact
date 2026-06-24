struct LargeDefaults {
    l1: Int = 0;
    l2: Int = 0;
    l3: Int = 0;
    l4: Int = 0;
    l5: Int = 0;
    l6: Int = 0;
    l7: Int = 0;
    l8: Int = 0;
    l9: Int = 0;
    l10: Int = 0;
}

contract TestContract {
    big: LargeDefaults;
    init() {
        self.big = LargeDefaults{};
    }
}