struct A { x: Int }
struct B { y: Bool }
struct C { z: String }

contract MixedTypes {
    fa: A;
    fb: B;
    fc: C;

    init() {
        self.fa = A{x:1};
        self.fb = B{y:true};
        self.fc = C{z:"hi"};
    }
}