struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

struct S3 {
    c: String;
}

contract TestContract {
    val1: S1;
    val2: S2;
    val3: S3;

    init() {
        self.val1 = S1{a:1};
        self.val2 = S2{b:true};
        self.val3 = S3{c:"hi"};
    }
}