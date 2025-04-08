struct SDefault {
    foo: Int = 5;
    bar: Bool = true;
}

contract UseDefaults {
    val: SDefault;

    init() {
        self.val = SDefault{};
    }
}