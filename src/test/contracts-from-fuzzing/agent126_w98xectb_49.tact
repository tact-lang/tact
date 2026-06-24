struct Composite {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract CompositeOpt {
    data: Composite;
    init() {
        self.data = Composite{ a:null, b:null, c:null };
    }
}