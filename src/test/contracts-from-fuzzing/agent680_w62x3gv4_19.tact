contract DefaultValueMixTest {
    field1: Int = 7;
    field2: Int;
    field3: Bool = false;
    field4: Bool;
    field5: String = "x";
    field6: String;

    init() {
        self.field2 = 14;
        self.field4 = true;
        self.field6 = "y";
    }

    receive() {
        let _ = self.field2 + 1;
    }
}