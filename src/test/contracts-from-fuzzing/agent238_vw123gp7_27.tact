struct MultiOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestMultiOpt {
    field: MultiOpt;

    init() {
        self.field = MultiOpt{a:null,b:null,c:null};
    }
}