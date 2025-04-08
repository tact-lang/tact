struct HoldsDefault {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract DefaultsInMembers {
    s: HoldsDefault;

    init() {
        self.s = HoldsDefault{ a: 42, b: true, c: "x" };
    }
}