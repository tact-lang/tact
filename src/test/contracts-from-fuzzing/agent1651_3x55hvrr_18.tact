contract Test18 {
    field1: Int;
    field2: Int = 1;
    field3: Int as int8 = 2;
    flag: Bool = false;

    init() {
        self.field1 = 42;
    }
}
