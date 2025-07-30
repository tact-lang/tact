struct OptionalS {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructNullable {
    opt: OptionalS;

    init() {
        self.opt = OptionalS{ a:null, b:null, c:null };
    }
}
