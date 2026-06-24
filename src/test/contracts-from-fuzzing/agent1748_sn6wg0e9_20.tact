struct StructA {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s1: StructA?;
    s2: StructA?;
    s3: StructA?;

    init() {
        self.s1 = StructA{ a:1, b:true, c:"x" };
        self.s2 = null;
        self.s3 = StructA{ a:42, b:false, c:null };
    }
}