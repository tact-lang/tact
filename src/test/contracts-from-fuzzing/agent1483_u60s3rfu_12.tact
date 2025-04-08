contract UninitializedVar {
    field1: Int;
    field2: Bool;

    init() {
        self.field1 = 42;
        self.field2 = true;
    }
}