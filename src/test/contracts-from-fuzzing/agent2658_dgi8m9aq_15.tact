contract NestedOptionals {
    maybeX: Int? = null;
    maybeY: String? = null;
    maybeZ: Bool? = null;

    init() {
        self.maybeX = 5;
        self.maybeY = "hi";
        self.maybeZ = true;
    }
}