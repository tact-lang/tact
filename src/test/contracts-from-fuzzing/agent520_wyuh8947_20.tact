contract ContradictionOptDefault {
    a: Int? = null;
    b: Bool? = null;

    init() {
        // explicit reset to null, redundant
        self.a = null;
        self.b = null;
    }
}