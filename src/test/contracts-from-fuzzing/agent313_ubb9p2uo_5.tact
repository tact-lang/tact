// many persistent fields of mixed primitive types
contract ManyPrimitives {
    a: Int = 1;
    b: Bool = true;
    c: Int = 2;
    d: Bool = false;
    s1: String = "one";
    s2: String = "two";
    e: Int = 3;
    f: Bool = true;
    g: String = "three";
    h: Int = 4;
    i: Bool = false;
    j: String = "four";

    init() {
        // override some defaults
        self.h = 123;
    }
}