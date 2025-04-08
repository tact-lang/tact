// Default and explicit optional nulls in one struct
struct MixedDefaults {
    a: Int?;           // implicit null default
    b: Bool? = null;   // explicit null default
    c: String? = null; // explicit
    d: Address?;       // implicit
}
contract TestContract {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{};
    }
}