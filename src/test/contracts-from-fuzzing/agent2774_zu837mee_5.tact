// large number of fields, diverse types
contract TestContract {
    a0: Int = 0;
    a1: Bool = false;
    a2: String = "";
    a3: Int = 3;
    a4: Bool = true;
    a5: String = "foo";
    a6: Int = 6;
    a7: Bool = false;
    a8: String = "bar";
    a9: Int = 9;
    a10: Bool = true;
    a11: String = "baz";
    a12: Int = 12;
    a13: Bool = false;
    a14: String = "qux";
    a15: Int = 15;

    init() {
        // override some
        self.a0 = 1;
        self.a1 = true;
        self.a2 = "hello";
    }
}