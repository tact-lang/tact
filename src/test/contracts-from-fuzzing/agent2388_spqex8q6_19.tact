struct ContradictDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "preset";
}

contract OverrideDefaults {
    val: ContradictDefaults;

    init() {
        self.val = ContradictDefaults{
            a: 5,
            b: false,
            c: "changed"
        };
    }
}