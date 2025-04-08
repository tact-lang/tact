struct Alt1 { x: Int = 1; }
struct Alt2 { y: Int = 2; }
struct Alt3 { z: Int = 3; }

contract ManyStructs {
    s1: Alt1;
    s2: Alt2;
    s3: Alt3;

    init() {
        self.s1 = Alt1{ x: 10 };
        self.s2 = Alt2{ y: 20 };
        self.s3 = Alt3{ z: 30 };
    }
}