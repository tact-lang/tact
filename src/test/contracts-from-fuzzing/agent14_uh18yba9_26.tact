struct MixedDefaults {
    a: Int = 1;
    b: Int?;           // implicit null default
    c: String = "ok";
    d: String?;        // implicit null default
    e: Bool = true;
    f: Bool?;          // implicit null default
}

contract MixedDefaultsPersist {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{};  // assign nothing explicitly, rely on defaults + nulls
    }
}