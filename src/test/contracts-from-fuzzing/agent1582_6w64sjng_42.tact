contract FieldNameClash {
    x: Int;
    X: Int;
    init() {
        self.x=1; self.X=2;
    }
}