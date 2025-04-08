contract InitSomeFields {
    field1: Int;
    field2: Int = 10;
    field3: Bool;
    field4: Bool = true;

    init() {
        self.field1 = 42;
        self.field3 = false;
    }
}