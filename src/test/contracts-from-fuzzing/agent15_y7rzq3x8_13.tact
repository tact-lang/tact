struct S1 { f: Int; }
struct S2 { f: String; }
struct S3 { f: Bool; }

contract TestContract {
    var1: S1;
    var2: S2;
    var3: S3;

    init() {
        self.var1 = S1{ f:11 };
        self.var2 = S2{ f:"hello" };
        self.var3 = S3{ f:true };
    }
}