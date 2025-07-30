struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

contract ManyNestedVars {
    s1: A;
    s2: B;
    s3: C;

    init() {
        self.s1 = A{ x: 7 };
        self.s2 = B{ y: true };
        self.s3 = C{ z: "foo" };
    }
}
