struct S1 { i: Int; }
struct S2 { i: Int; }
struct S3 { i: Int; }

contract TestContract {
    s1: S1;
    s2: S2;
    s3: S3;
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;

    init() {
        self.s1 = S1{i:1};
        self.s2 = S2{i:2};
        self.s3 = S3{i:3};
        self.intVal = 99;
        self.boolVal = false;
        self.strVal = "x";
        self.optI = null;
        self.optB = true;
        self.optS = null;
    }
}