// Mix explicit defaults and init assignment for persistent fields
contract DefaultsAndAssigns {
    x: Int = 5;
    y: Bool = true;
    z: String;

    init() {
        self.z = "assigned";
    }
}