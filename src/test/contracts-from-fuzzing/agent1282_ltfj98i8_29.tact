// Many primitives with explicit default values
contract ManyDefaults {
    n1: Int = 1;
    n2: Int = 2;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "one";
    s2: String = "two";

    init() {
        self.n1 = 1;
        self.n2 = 2;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "one";
        self.s2 = "two";
    }
}