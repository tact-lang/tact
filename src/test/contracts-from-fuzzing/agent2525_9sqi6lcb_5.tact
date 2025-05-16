struct MixedOptionalDefault {
    a: Int?;                  // default null
    b: Bool = false;         // default false
    c: String? = null;       // explicit null default
    d: Int;                  // mandatory
}

contract TestContract {
    val: MixedOptionalDefault;

    init() {
        self.val = MixedOptionalDefault{
            d: 42
        };
    }
}