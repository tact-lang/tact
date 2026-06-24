contract EmptyOptionalInit {
    optionalInt: Int?;

    init() {
        self.optionalInt = null; // explicit, default
    }
}