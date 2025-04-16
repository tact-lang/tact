struct VarOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract InitNulls {
    data: VarOpt = VarOpt{ a:null, b:null, c:null };
    init() {
        self.data = VarOpt{ a:null, b:null, c:null };
    }
}