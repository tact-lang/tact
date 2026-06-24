struct Serial1 { a: Int }
struct Serial2 { b: Int }
struct Serial3 { c: Int }

contract ManySerial {
    s1: Serial1;
    s2: Serial2;
    s3: Serial3;

    init() {
        self.s1 = Serial1{ a: 1 };
        self.s2 = Serial2{ b: 2 };
        self.s3 = Serial3{ c: 3 };
    }
}