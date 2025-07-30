struct A { a: Int; b: Bool }
struct B { c: Int?; d: String }
struct C { e: A; f: B } 

contract TestContract {
    s1: A;
    s2: B;
    s3: C;

    init() {
        self.s1 = A{ a:1, b:true };
        self.s2 = B{ c:null, d:"hi" };
        self.s3 = C{ e:self.s1, f:self.s2 };
    }
}