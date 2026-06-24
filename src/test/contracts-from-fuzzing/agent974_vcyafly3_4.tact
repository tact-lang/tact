struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct S4 { d: Cell; }

contract MixedStructFields {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    flag: Bool = true;

    init() {
        self.s1 = S1{ a: 1 };
        self.s2 = S2{ b: true };
        self.s3 = S3{ c: "hello" };
        self.s4 = S4{ d: emptyCell() };
    }
}