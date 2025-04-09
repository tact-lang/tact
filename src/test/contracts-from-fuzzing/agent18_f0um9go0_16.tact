struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

contract ManyTypes {
    s1: S1;
    s2: S2;
    s3: S3;
    num: Int;
    txt: String;
    flag: Bool;

    init() {
        self.s1 = S1{ a: 1 };
        self.s2 = S2{ b: true };
        self.s3 = S3{ c: "test" };
        self.num = 42;
        self.txt = "hello";
        self.flag = false;
    }
}
