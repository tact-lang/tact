struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{a:null,b:true,c:null};
    }
}