struct OuterS {
    f: InnerS;
}
struct InnerS {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalSubStruct {
    data: OuterS;

    init() {
        self.data = OuterS{ f: InnerS{ a:null, b:null, c:null } };
    }
}