struct S {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract WithNullStruct {
    val: S;

    init() {
        self.val = S{ i:null, b:null, s:null, a:null };
    }
}