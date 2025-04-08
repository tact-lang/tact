// contract mixing fields with defaults and init override
contract Test24 {
    a: Int = 1;
    b: Int;
    c: String = "abc";

    init() {
        self.b = 42;
        self.c = "def";
    }
}