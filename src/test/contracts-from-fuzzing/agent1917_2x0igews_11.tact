struct SomeDefaults {
    i: Int = 99;
    b: Bool;
}

contract PartialDefaults {
    data: SomeDefaults;

    init() {
        self.data = SomeDefaults{b: true};
    }
}
