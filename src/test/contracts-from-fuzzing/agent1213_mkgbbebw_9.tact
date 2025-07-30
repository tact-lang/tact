struct OptionalRec {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalRecTest {
    rec: OptionalRec;

    init() {
        self.rec = OptionalRec{ a:null, b:null, c:null, d:null };
    }
}