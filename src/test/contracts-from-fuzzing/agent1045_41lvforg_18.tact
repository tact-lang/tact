// contract with default values on optional and non-optional fields

contract TestContract {
    a: Int = 5;
    b: String = "test";
    c: Bool? = null;
    d: String? = null;

    init() {
        self.a = 42;
        self.b = "changed";
        self.c = true;
        self.d = "set";
    }
}