// Test contract fields directly with many optionals and types

contract TestContract {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: String?;
    f: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = "hello";
        self.f = null;
    }
}