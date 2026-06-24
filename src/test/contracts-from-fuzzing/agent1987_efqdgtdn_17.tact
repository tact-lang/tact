contract OptionalContractMany {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;

    init() {
        self.a=null; self.b=1; self.c=true; self.d="x"; self.e=null;
    }
}