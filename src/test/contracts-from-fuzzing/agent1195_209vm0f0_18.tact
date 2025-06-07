struct MultiTypeOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiOptTest {
    f: MultiTypeOpt;
    g: MultiTypeOpt?;

    init() {
        self.f = MultiTypeOpt{a:null,b:true,c:null};
        self.g = null;
    }
}
