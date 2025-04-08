struct SDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;
}

contract StructAssignOverride {
    data: SDefaults;

    init() {
        self.data = SDefaults{
            a: 5,
            b: "changed",
            c: true
        };
    }
}