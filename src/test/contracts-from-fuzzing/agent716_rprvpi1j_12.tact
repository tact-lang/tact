struct OptComp {
    a: Int?;          // implicit null
    b: Int? = null;  // explicit null
    c: String?;      // implicit null
    d: Bool? = null; // explicit null
}

contract OptDefaults {
    data: OptComp;

    init() {
        self.data = OptComp{
            a: null, b: 5, c: "x", d: null
        };
    }
}