struct A { f: Int; }
struct B { f: String; }
struct C { f: Bool; }

contract MixStructFields {
    x: A;
    y: B;
    z: C;

    init() {
        self.x = A{f: 1};
        self.y = B{f: "zz"};
        self.z = C{f: false};
    }
}