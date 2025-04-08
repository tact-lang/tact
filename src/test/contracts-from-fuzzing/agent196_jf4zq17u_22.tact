contract FieldInitializationOrder {
    x: Int = 2;
    y: Int;

    init() {
        self.y = self.x * 3;
    }
}